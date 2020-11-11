import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:fordev/domain/entities/entities.dart';
import 'package:fordev/domain/usecases/usecases.dart';

import 'package:fordev/ui/helpers/errors/errors.dart';

import 'package:fordev/presentation/presenters/presenters.dart';
import 'package:fordev/presentation/protocols/protocols.dart';

class ValidationSpy extends Mock implements Validation {}

class AddAccountSpy extends Mock implements AddAccount {}

class SaveCurrentAccountSpy extends Mock implements SaveCurrentAccount {}

void main() {
  GetxSignUpPresenter sut;
  ValidationSpy validation;
  AddAccountSpy addAccount;
  SaveCurrentAccountSpy saveCurrentAccount;

  String email;
  String name;
  String password;
  String passwordConfirmation;
  String token;

  PostExpectation mockValidationCall(String field) => when(validation.validate(
      field: field == null ? anyNamed('field') : field,
      value: anyNamed('value')));

  void mockValidation({String field, ValidationError value}) {
    mockValidationCall(field).thenReturn(value);
  }

  PostExpectation mockAddAccountCall() => when(addAccount.add(any));

  void mockAddAccount() {
    mockAddAccountCall().thenAnswer((_) async => AccountEntity(token));
  }

  setUp(() {
    validation = ValidationSpy();
    addAccount = AddAccountSpy();
    saveCurrentAccount = SaveCurrentAccountSpy();
    sut = GetxSignUpPresenter(
      validation: validation,
      addAccount: addAccount,
      saveCurrentAccount: saveCurrentAccount,
    );

    email = faker.internet.email();
    name = faker.person.name();
    password = faker.internet.password();
    passwordConfirmation = faker.internet.password();
    token = faker.guid.guid();
    mockValidation();
    mockAddAccount();
  });

  test('Should call Validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit invalidFieldError if email is invalid', () {
    mockValidation(value: ValidationError.invalidField);

    sut.emailErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.invalidField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit requiredFieldError if email is empty', () {
    mockValidation(value: ValidationError.requiredField);

    sut.emailErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.requireField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit null if email validation succeeds', () {
    sut.emailErrorStream.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should call Validation with correct name', () {
    sut.validateName(name);

    verify(validation.validate(field: 'name', value: name)).called(1);
  });

  test('Should emit invalidFieldError if name is invalid', () {
    mockValidation(value: ValidationError.invalidField);

    sut.nameErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.invalidField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateName(name);
    sut.validateName(name);
  });

  test('Should emit requiredFieldError if name is empty', () {
    mockValidation(value: ValidationError.requiredField);

    sut.nameErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.requireField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateName(name);
    sut.validateName(name);
  });

  test('Should emit null if email validation succeeds', () {
    sut.nameErrorStream.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateName(name);
    sut.validateName(name);
  });

  test('Should call Validation with correct password', () {
    sut.validatePassword(password);

    verify(validation.validate(field: 'password', value: password)).called(1);
  });

  test('Should emit invalidFieldError if password is invalid', () {
    mockValidation(value: ValidationError.invalidField);

    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.invalidField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should emit requiredFieldError if password is empty', () {
    mockValidation(value: ValidationError.requiredField);

    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.requireField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should emit null if password validation succeeds', () {
    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should call Validation with correct passwordConfirmation', () {
    sut.validatePasswordConfirmation(passwordConfirmation);

    verify(validation.validate(
            field: 'passwordConfirmation', value: passwordConfirmation))
        .called(1);
  });

  test('Should emit invalidFieldError if passwordConfirmation is invalid', () {
    mockValidation(value: ValidationError.invalidField);

    sut.passwordConfirmationErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.invalidField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePasswordConfirmation(passwordConfirmation);
    sut.validatePasswordConfirmation(passwordConfirmation);
  });

  test('Should emit requiredFieldError if passwordConfirmation is empty', () {
    mockValidation(value: ValidationError.requiredField);

    sut.passwordConfirmationErrorStream
        .listen(expectAsync1((error) => expect(error, UiError.requireField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePasswordConfirmation(passwordConfirmation);
    sut.validatePasswordConfirmation(passwordConfirmation);
  });

  test('Should emit null if passwordConfirmation validation succeeds', () {
    sut.passwordConfirmationErrorStream
        .listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePasswordConfirmation(passwordConfirmation);
    sut.validatePasswordConfirmation(passwordConfirmation);
  });

  test('Should enable form button if all fields are valid', () async {
    expectLater(sut.isFormValidStream, emitsInOrder([false, true]));

    sut.validateEmail(email);
    await Future.delayed(Duration.zero);
    sut.validateName(name);
    await Future.delayed(Duration.zero);
    sut.validatePassword(password);
    await Future.delayed(Duration.zero);
    sut.validatePasswordConfirmation(passwordConfirmation);
    await Future.delayed(Duration.zero);
  });

  test('Should AddAccount with correct values', () async {
    expectLater(sut.isFormValidStream, emitsInOrder([false, true]));

    sut.validateEmail(email);
    sut.validateName(name);
    sut.validatePassword(password);
    sut.validatePasswordConfirmation(passwordConfirmation);

    await sut.signUp();

    verify(addAccount.add(AddAccountParams(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    ))).called(1);
  });

  test('Should call SaveCurrentAccount with correct value', () async {
    sut.validateEmail(email);
    sut.validateName(name);
    sut.validatePassword(password);
    sut.validatePasswordConfirmation(passwordConfirmation);

    await sut.signUp();

    verify(saveCurrentAccount.save(AccountEntity(token))).called(1);
  });
}
