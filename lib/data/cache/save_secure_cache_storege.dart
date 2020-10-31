import 'package:meta/meta.dart';

abstract class SaveSecureCaheStorage {
  Future<void> saveSecure({@required String key, @required String value});
}
