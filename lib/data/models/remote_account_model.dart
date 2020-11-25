import '../http/http.dart';
import '../../domain/entities/entities.dart';

class RemoteAccountModel {
  final String accesstoken;

  RemoteAccountModel(this.accesstoken);

  factory RemoteAccountModel.fromJson(Map json) {
    if (!json.containsKey('accessToken')) {
      throw HttpError.invalidDat;
    }
    return RemoteAccountModel(json['accessToken']);
  }

  AccountEntity toEntity() => AccountEntity(token: accesstoken);
}
