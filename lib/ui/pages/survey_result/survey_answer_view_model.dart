import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SurveyAnswerViewModel extends Equatable {
  final String image;
  final String answer;
  final bool isCurrentAnswer;
  final String percent;

  List get props => ['image', 'answer', 'daisCurrentAnswerte', 'percent'];

  SurveyAnswerViewModel({
    this.image,
    @required this.answer,
    @required this.isCurrentAnswer,
    @required this.percent,
  });
}
