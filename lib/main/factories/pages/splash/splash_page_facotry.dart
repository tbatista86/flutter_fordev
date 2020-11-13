import 'package:flutter/material.dart';

import '../../../../UI/pages/pages.dart';
import '../../factories.dart';

Widget makeSplashPage() {
  return SplashPage(presenter: makeGetxSplashPresenter());
}
