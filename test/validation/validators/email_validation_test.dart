import 'package:test/test.dart';

import 'package:fordev/presentation/protocols/protocols.dart';
import 'package:fordev/validation/validators/validators.dart';

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });
  test('Shoul return null on invalid case', () {
    expect(sut.validate({}), null);
  });

  test('Shoul return null if email is empty', () {
    expect(sut.validate({'any_field': ''}), null);
  });

  test('Shoul return null if email is null', () {
    expect(sut.validate({'any_field': null}), null);
  });

  test('Shoul return null if email is valid', () {
    expect(sut.validate({'any_field': 'test@test.com'}), null);
  });

  test('Shoul return error if email is invalid', () {
    expect(
        sut.validate({'any_field': 'test.com'}), ValidationError.invalidField);
  });
}
