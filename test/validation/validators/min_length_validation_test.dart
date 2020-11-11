import 'package:test/test.dart';
import 'package:fordev/presentation/protocols/protocols.dart';
import 'package:fordev/validation/protocols/protocols.dart';

class MinLenghtValidation implements FieldValidation {
  final String field;
  final int size;

  MinLenghtValidation({this.field, this.size});

  ValidationError validate(String value) {
    return ValidationError.invalidField;
  }
}

void main() {
  test('Should return error if value is empty', () {
    final sut = MinLenghtValidation(field: 'any_field', size: 5);
    final error = sut.validate('');
    expect(error, ValidationError.invalidField);
  });

  test('Should return error if value is null', () {
    final sut = MinLenghtValidation(field: 'any_field', size: 5);
    final error = sut.validate(null);
    expect(error, ValidationError.invalidField);
  });
}
