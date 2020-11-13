import '../../../../presentation/presenters/presenters.dart';
import '../../../../UI/pages/pages.dart';
import '../../factories.dart';

SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(loadCurrentAccount: makeLocalLoadCurrentAccount());
}
