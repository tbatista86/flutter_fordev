import 'package:flutter/material.dart';
import 'package:fordev/UI/pages/pages.dart';
import 'package:get/get.dart';

import '../../factories.dart';
import '../../../../UI/pages/login/login.dart';

Widget makeLoginPage() {
  final presenter = Get.put<LoginPresenter>(makeGetxLoginPresenter());
  return LoginPage(presenter);
}
