import 'package:flutter/material.dart';

import '../../factories.dart';
import '../../../../UI/pages/pages.dart';

// Widget makeSignUpPage() {
//   final presenter = Get.put<LoginPresenter>(makeGetxLoginPresenter());
//   return LoginPage(presenter);
// }

Widget makeSignUpPage() => SignUpPage(makeGetxSignUpPresenter());
