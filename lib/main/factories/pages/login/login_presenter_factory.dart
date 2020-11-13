import '../../../../presentation/presenters/presenters.dart';
import '../../../../UI/pages/login/login.dart';

import '../../factories.dart';

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
    authentication: makeRemoteAuthentication(),
    validation: makeLoginValidation(),
    saveCurrentAccount: makeLocalSaveCurrentAccount(),
  );
}
