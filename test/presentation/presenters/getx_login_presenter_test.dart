import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:fordev/domain/entities/entities.dart';
import 'package:fordev/domain/helpers/helpers.dart';
import 'package:fordev/domain/usecases/usecases.dart';

import 'package:fordev/presentation/presenters/presenters.dart';
import 'package:fordev/presentation/protocols/protocols.dart';

class ValidationSpy extends Mock implements Validation {}

class AuthenticationSpy extends Mock implements Authentication {}

void main() {
  GetxLoginPresenter sut;
  AuthenticationSpy authentication;
  ValidationSpy validation;
  String email;
  String password;

  PostExpectation mockValidationCall(String field) => when(validation.validate(
      field: field == null ? anyNamed('field') : field,
      value: anyNamed('value')));

  void mockValidation({String field, String value}) {
    mockValidationCall(field).thenReturn(value);
  }

  PostExpectation mockAuthencticationCall() => when(authentication.auth(any));

  void mockAuthenctication() {
    mockAuthencticationCall()
        .thenAnswer((_) async => AccountEntity(faker.guid.guid()));
  }

  void mockAuthencticationError(DomainError error) {
    mockAuthencticationCall().thenThrow(error);
  }

  setUp(() {
    validation = ValidationSpy();
    authentication = AuthenticationSpy();
    sut = GetxLoginPresenter(
        validation: validation, authentication: authentication);
    email = faker.internet.email();
    password = faker.internet.password();
    mockValidation();
    mockAuthenctication();
  });

  test('Should call Validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit email error if validation fails', () {
    mockValidation(value: 'error');

    sut.emailError.listen(expectAsync1((error) => expect(error, 'error')));
    sut.isFormValid.listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit null if email validation succeeds', () {
    sut.emailError.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValid.listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should call Validation with correct password', () {
    sut.validatePassword(password);

    verify(validation.validate(field: 'password', value: password)).called(1);
  });

  test('Should emit password error if validation fails', () {
    mockValidation(value: 'error');

    sut.passwordError.listen(expectAsync1((error) => expect(error, 'error')));
    sut.isFormValid.listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should emit null if password validation succeeds', () {
    sut.passwordError.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValid.listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should emit email error if validation email fails', () {
    mockValidation(field: 'email', value: 'error');

    sut.emailError.listen(expectAsync1((error) => expect(error, 'error')));
    sut.passwordError.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValid.listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validatePassword(password);
  });

  test('Should emit email error if validation email fails', () async {
    sut.emailError.listen(expectAsync1((error) => expect(error, null)));
    sut.passwordError.listen(expectAsync1((error) => expect(error, null)));
    expectLater(sut.isFormValid.stream, emitsInOrder([false, true]));

    sut.validateEmail(email);
    await Future.delayed(Duration.zero);
    sut.validatePassword(password);
  });

  test('Should call authentication with correct values', () async {
    sut.validateEmail(email);
    sut.validatePassword(password);

    await sut.auth();

    verify(authentication
            .auth(AuthenticationParams(email: email, secret: password)))
        .called(1);
  });

  test('Should emit correct events on Authenticationsuccess', () async {
    sut.validateEmail(email);
    sut.validatePassword(password);

    expectLater(sut.isLoading.stream, emitsInOrder([true, false]));

    await sut.auth();
  });

  test('Should emit correct events on InvalidCredentialsError', () async {
    mockAuthencticationError(DomainError.invalidCredentials);
    sut.validateEmail(email);
    sut.validatePassword(password);

    expectLater(sut.isLoading.stream, emitsInOrder([true, false]));

    sut.mainError.listen(
        expectAsync1((error) => expect(error, 'Credencias inválidas.')));

    await sut.auth();
  });

  test('Should emit correct events on UnexpectedError', () async {
    mockAuthencticationError(DomainError.unexpected);
    sut.validateEmail(email);
    sut.validatePassword(password);

    expectLater(sut.isLoading.stream, emitsInOrder([true, false]));

    sut.mainError.listen(expectAsync1((error) =>
        expect(error, 'Algo errado aconteceu. Tente novamente em breve.')));

    await sut.auth();
  });
}