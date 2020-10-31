import 'package:flutter/material.dart';
import 'package:fordev/ui/pages/pages.dart';
import 'package:get/get.dart';

import '../../factories.dart';
import '../../../../ui/pages/login/login_page.dart';

Widget makeLoginPage() {
  final presenter = Get.put<LoginPresenter>(makeGetxLoginPresenter());
  return LoginPage(presenter);
}
