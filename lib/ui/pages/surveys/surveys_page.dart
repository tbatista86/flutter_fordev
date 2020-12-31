import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './surveys_presenter.dart';
import '../../helpers/helpers.dart';
import './components/components.dart';

class SurveysPage extends StatelessWidget {
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    presenter.loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(R.string.surveys),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 1,
          ),
          items: [
            Surveyitem(),
            Surveyitem(),
            Surveyitem(),
          ],
        ),
      ),
    );
  }
}
