import 'package:meta/meta.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/domain_error.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/local_survey_model.dart';
import '../../cache/cache.dart';

class LocalLoadSurveys implements LoadSurveys {
  final CacheStorage cacheStorage;

  LocalLoadSurveys({@required this.cacheStorage});

  Future<List<SurveyEntity>> load() async {
    try {
      final data = await cacheStorage.fetch('surveys');
      if (data?.isEmpty != false) {
        throw Exception();
      }
      return _map(data);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }

  Future<void> validate() async {
    final data = await cacheStorage.fetch('surveys');
    try {
      _map(data);
    } catch (error) {
      await cacheStorage.delete('surveys');
    }
  }

  List<SurveyEntity> _map(List<Map> list) => list
      .map<SurveyEntity>((json) => LocalSurveyModel.fromJson(json).toEntity())
      .toList();
}
