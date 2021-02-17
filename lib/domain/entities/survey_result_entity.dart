import 'package:meta/meta.dart';
import './entities.dart';

class SurveyResultEntity {
  final String suurveyId;
  final String question;
  final List<SurveyAnswerEntity> didAnswer;

  SurveyResultEntity({
    @required this.suurveyId,
    @required this.question,
    @required this.didAnswer,
  });
}
