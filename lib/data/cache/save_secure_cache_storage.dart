import 'package:meta/meta.dart';

abstract class SaveSecureCaheStorage {
  Future<void> save({@required String key, @required String value});
}
