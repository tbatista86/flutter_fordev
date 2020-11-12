import 'package:test/test.dart';

import 'package:fordev/main/factories/factories.dart';
import 'package:fordev/validation/validators/validators.dart';

void main() {
  test('Should return the corrrect validations', () {
    final valodations = makeLoginValidations();

    expect(valodations, [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
      MinLenghtValidation(field: 'password', size: 3),
    ]);
  });
}
