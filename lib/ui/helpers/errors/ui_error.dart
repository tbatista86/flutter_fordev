import '../helpers.dart';

enum UiError {
  requireField,
  invalidField,
  unexpected,
  invalidCredentials,
  emailInUse,
}

extension UiErrorExtension on UiError {
  String get description {
    switch (this) {
      case UiError.requireField:
        return R.string.msgRequiredField;
      case UiError.invalidField:
        return R.string.msgInvalidField;
      case UiError.invalidCredentials:
        return R.string.msgInvalidCredential;
      case UiError.emailInUse:
        return R.string.msgEmailInUse;
      default:
        return R.string.msgDefaultError;
    }
  }
}
