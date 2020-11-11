import 'package:meta/meta.dart';
import '../protocols/protocols.dart';
import '../../presentation/protocols/protocols.dart';

class MinLenghtValidation implements FieldValidation {
  final String field;
  final int size;

  MinLenghtValidation({@required this.field, @required this.size});

  ValidationError validate(String value) {
    return value != null && value.length >= size
        ? null
        : ValidationError.invalidField;
  }
}
