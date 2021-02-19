import './survey_result.dart';

abstract class SurveyResultPresenter {
  Stream<bool> get isLoadingStream;
  Stream<SurveyResultViewModel> get surveysResultStream;
  Future<void> loadData();
}
