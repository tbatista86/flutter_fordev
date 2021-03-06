import './survey_view_model.dart';

abstract class SurveysPresenter {
  Stream<bool> get isLoadingStream;
  Stream<List<SurveyViewModel>> get surveysStream;
  Stream<String> get navigateToStream;
  Future<void> loadData();
  void gotoSurveyResult(String surveyId);
}
