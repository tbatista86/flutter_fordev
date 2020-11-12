import '../../validation/protocols/protocols.dart';
import '../../validation/validators/validators.dart';

class ValidationBuilder {
  static ValidationBuilder _instance;
  String filedName;
  List<FieldValidation> validations = [];

  ValidationBuilder._();

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._();
    _instance.filedName = fieldName;
    return _instance;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(filedName));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidation(filedName));
    return this;
  }

  ValidationBuilder min(int size) {
    validations.add(MinLenghtValidation(field: filedName, size: size));
    return this;
  }

  List<FieldValidation> build() => validations;
}
