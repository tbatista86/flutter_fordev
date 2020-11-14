import '../helpers.dart';

enum UIError {
  requireField,
  invalidField,
  unexpected,
  invalidCredentials,
  emailInUse,
}

extension UiErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requireField:
        return R.string.msgRequiredField;
      case UIError.invalidField:
        return R.string.msgInvalidField;
      case UIError.invalidCredentials:
        return R.string.msgInvalidCredential;
      case UIError.emailInUse:
        return R.string.msgEmailInUse;
      default:
        return R.string.msgDefaultError;
    }
  }
}
