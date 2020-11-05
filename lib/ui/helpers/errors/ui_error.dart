import 'package:fordev/ui/helpers/helpers.dart';

enum UiError {
  requireField,
  invalidField,
  unexpected,
  invalidCredentials,
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
      default:
        return R.string.msgDefaultError;
    }
  }
}
