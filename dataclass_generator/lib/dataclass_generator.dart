library dataclass_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dataclass/dataclass.dart';
import 'package:source_gen/source_gen.dart';

Builder dataClass(BuilderOptions options) =>
    SharedPartBuilder([DataClassGenerator()], 'dataclass');

class DataClassGenerator extends GeneratorForAnnotation<DataClass> {
  final emitter = DartEmitter();
  final formatter = DartFormatter();

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    void _isSourceValid(ClassElement element) {
      if (element.unnamedConstructor == null) {
        throw InvalidGenerationSourceError(
            'The @DataClass class must have unnamed (default) constructor');
      }
      if (!element.unnamedConstructor.parameters
          .any((param) => param.isNamed)) {
        throw InvalidGenerationSourceError(
            'The @DataClass class constructor should have named params only');
      }
      if (element.fields.any((field) => !field.isFinal)) {
        throw InvalidGenerationSourceError(
            '@DataClass should have final fields only');
      }
    }

    if (element is ClassElement && !element.isAbstract) {
      _isSourceValid(element);

      final equalsMethod = _equalsMethod(element.name, element.fields);
      final copyWithMethod = _copyWithMethod(element.name, element.fields);
      final hashCodeMethod = _hashCodeMethod(element.fields);
      final toStringMethod = _toStringMethod(element.name, element.fields);

      final getters = element.fields
          .map((field) => MethodBuilder()
            ..name = field.name
            ..returns = refer(field.type.name)
            ..type = MethodType.getter)
          .map((mb) => mb.build());

      final constConstructor = (ConstructorBuilder()..constant = true).build();

      final dataClass = ClassBuilder()
        ..name = '_${element.name}'
        ..constructors.add(constConstructor)
        ..methods.addAll(getters)
        ..methods.add(equalsMethod)
        ..methods.add(hashCodeMethod)
        ..methods.add(toStringMethod)
        ..methods.add(copyWithMethod)
        ..abstract = true;

      return formatter.format(dataClass.build().accept(emitter).toString());
    } else {
      throw Exception(
        '@DataClass anontation cannot be used on abstract classes',
      );
    }
  }

  Method _equalsMethod(String className, List<FieldElement> fields) {
    MethodBuilder mb = MethodBuilder()
      ..name = 'operator=='
      ..requiredParameters.add((ParameterBuilder()..name = 'other').build())
      ..returns = refer('bool')
      ..body = Code(
        equalsBody(className, fields.map((element) => element.name)),
      );

    return mb.build();
  }

  Method _hashCodeMethod(List<FieldElement> fields) {
    final props = fields.map((field) => field.name);

    MethodBuilder mb = MethodBuilder()
      ..name = 'hashCode'
      ..type = MethodType.getter
      ..returns = refer('int')
      ..body = Code(
        '''
        return mapPropsToHashCode([${props.join(', ')}]);
        ''',
      );

    return mb.build();
  }

  Method _copyWithMethod(String className, List<FieldElement> fields) {
    final params = fields
        .map((field) => ParameterBuilder()
          ..name = field.name
          ..type = refer(field.type.name)
          ..named = true)
        .map((paramBuilder) => paramBuilder.build());

    final mb = MethodBuilder()
      ..name = 'copyWith'
      ..optionalParameters.addAll(params)
      ..returns = refer(className)
      ..body =
          Code(copyToMethodBody(className, fields.map((field) => field.name)));

    return mb.build();
  }

  Method _toStringMethod(String className, List<FieldElement> fields) {
    final mb = MethodBuilder()
      ..name = 'toString'
      ..returns = refer('String')
      ..body = Code(toStringBody(className, fields.map((field) => field.name)));

    return mb.build();
  }
}

String equalsBody(String className, Iterable<String> fields) {
  final fieldEquals = fields.fold<String>('true', (value, element) {
    return '$value && this.$element == other.$element';
  });

  return '''
  if (identical(this, other)) return true;
  if (other is! $className) return false;

  return $fieldEquals;
''';
}

String copyToMethodBody(String className, Iterable<String> fields) {
  final paramsInput = fields.fold(
    "",
    (r, field) => "$r ${field}: ${field} ?? this.${field},",
  );

  return '''return $className($paramsInput);''';
}

String toStringBody(String className, Iterable<String> fields) {
  final fieldsToString =
      fields.fold('', (r, field) => r + '\\\'$field\\\': \${this.$field},');

  return "return '$className <$fieldsToString>';";
}
