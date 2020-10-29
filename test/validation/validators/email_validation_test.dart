import 'package:test/test.dart';
import 'package:fordev/validation/protocols/protocols.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  String validate(String value) {
    return null;
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
}
