import 'package:flutter/material.dart';
import '../../factories.dart';
import '../../../../UI/pages/login/login.dart';
import '../../../../UI/pages/pages.dart';

// Widget makeLoginPage() {
//   final presenter = Get.put<LoginPresenter>(makeGetxLoginPresenter());
//   return LoginPage(presenter);
// }

Widget makeLoginPage() => LoginPage(makeGetxLoginPresenter());
