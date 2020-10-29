import 'package:test/test.dart';

import 'package:fordev/validation/protocols/protocols.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  String validate(String value) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = value?.isNotEmpty != true || regex.hasMatch(value);

    return isValid ? null : 'Campo inválido.';
  }
}

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });
  test('Shoul return null if email is empty', () {
    expect(sut.validate(''), null);
  });

  test('Shoul return null if email is null', () {
    expect(sut.validate(null), null);
  });

  test('Shoul return null if email is valid', () {
    expect(sut.validate('tiago@devel.com'), null);
  });

  test('Shoul return error if email is invalid', () {
    expect(sut.validate('tiago.devel'), 'Campo inválido.');
  });
}
