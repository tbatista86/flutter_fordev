import 'package:test/test.dart';

import 'package:fordev/main/factories/factories.dart';
import 'package:fordev/validation/validators/validators.dart';

void main() {
  test('Should return the corrrect validations', () {
    final valodations = makeSignUpValidations();

    expect(valodations, [
      RequiredFieldValidation('name'),
      MinLenghtValidation(field: 'name', size: 3),
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
      MinLenghtValidation(field: 'password', size: 3),
      RequiredFieldValidation('passwordConfirmation'),
      CompareFieldsValidation(
          field: 'passwordConfirmation', fieldToCompare: 'password'),
    ]);
  });
}
