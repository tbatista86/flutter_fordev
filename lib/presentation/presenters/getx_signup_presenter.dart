import 'package:fordev/ui/pages/signup/signup_presenter.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../ui/helpers/errors/errors.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/helpers/helpers.dart';

import '../protocols/protocols.dart';

class GetxSignUpPresenter extends GetxController implements SignUpPresenter {
  final Validation validation;
  final AddAccount addAccount;
  final SaveCurrentAccount saveCurrentAccount;

  final _emailError = Rx<UiError>();
  final _nameError = Rx<UiError>();
  final _passwordError = Rx<UiError>();
  final _passwordConfirmationError = Rx<UiError>();
  final _mainError = Rx<UiError>();
  final _navigateTo = RxString();
  final _isFormValid = false.obs;
  final _isLoading = false.obs;

  String _name;
  String _email;
  String _password;
  String _passwordConfirmation;

  Stream<UiError> get emailErrorStream => _emailError.stream;
  Stream<UiError> get passwordErrorStream => _passwordError.stream;
  Stream<UiError> get passwordConfirmationErrorStream =>
      _passwordConfirmationError.stream;
  Stream<UiError> get mainErrorStream => _mainError.stream;
  Stream<UiError> get nameErrorStream => _nameError.stream;
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxSignUpPresenter({
    @required this.validation,
    @required this.addAccount,
    @required this.saveCurrentAccount,
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

  Future<void> signUp() async {
    try {
      _isLoading.value = true;
      final account = await addAccount.add(AddAccountParams(
        name: _name,
        email: _email,
        password: _password,
        passwordConfirmation: _passwordConfirmation,
      ));
      await saveCurrentAccount.save(account);
      _navigateTo.value = '/surveys';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          _mainError.value = UiError.invalidCredentials;
          break;
        case DomainError.emailInUse:
          _mainError.value = UiError.emailInUse;
          break;
        default:
          _mainError.value = UiError.unexpected;
      }
      _isLoading.value = false;
    }
  }

  void gotoLogin() {
    _navigateTo.value = '/login';
  }
}
