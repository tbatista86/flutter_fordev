import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../ui/helpers/errors/errors.dart';

import '../protocols/protocols.dart';

class GetxSignUpPresenter extends GetxController {
  final Validation validation;

  final _emailError = Rx<UiError>();
  final _nameError = Rx<UiError>();
  final _passwordError = Rx<UiError>();
  final _passwordConfirmationError = Rx<UiError>();
  final _isFormValid = false.obs;

  String _name;
  String _email;
  String _password;
  String _passwordConfirmation;

  Stream<UiError> get emailErrorStream => _emailError.stream;
  Stream<UiError> get passwordErrorStream => _passwordError.stream;
  Stream<UiError> get passwordConfirmationErrorStream =>
      _passwordConfirmationError.stream;
  Stream<UiError> get nameErrorStream => _nameError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;

  GetxSignUpPresenter({
    @required this.validation,
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField(field: 'email', value: email);
    _validateForm();
  }

  void validateName(String name) {
    _name = name;
    _nameError.value = _validateField(field: 'name', value: name);
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField(field: 'password', value: password);
    _validateForm();
  }

  void validatePasswordConfirmation(String passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
    _passwordConfirmationError.value = _validateField(
        field: 'passwordConfirmation', value: passwordConfirmation);
    _validateForm();
  }

  UiError _validateField({String field, String value}) {
    final error = validation.validate(field: field, value: value);
    switch (error) {
      case ValidationError.invalidField:
        return UiError.invalidField;
      case ValidationError.requiredField:
        return UiError.requireField;
      default:
        null;
    }
  }

  void _validateForm() {
    _isFormValid.value = _emailError.value == null &&
        _passwordError.value == null &&
        _passwordConfirmationError.value == null &&
        _nameError.value == null &&
        _name != null &&
        _email != null &&
        _password != null &&
        _passwordConfirmation != null;
  }
}
