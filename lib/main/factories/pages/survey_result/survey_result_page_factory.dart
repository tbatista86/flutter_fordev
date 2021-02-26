import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../factories.dart';
import '../../../../ui/pages/pages.dart';

Widget makeSurveysResultPage() => SurveyResultPage(
    makeGetxSurveyResultPresenter(Get.parameters['survey_id']));
