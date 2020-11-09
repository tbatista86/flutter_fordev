import '../../helpers/errors/ui_error.dart';

abstract class SignUpPresenter {
  Stream<UiError> get nameErrorStream;
  Stream<UiError> get emailErrorStream;
  Stream<UiError> get passwordErrorStream;
  Stream<UiError> get passwordConfirmationErrorStream;
  Stream<bool> get isFormValidControllerStream;

  void validateName(String name);
  void validateEmail(String email);
  void validatePassword(String password);
  void validatePasswordConfirmation(String passwordConfirmation);

  Future<void> signUp();
}
