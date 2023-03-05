import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends FutureViewModel {
  @override
  Future<void> futureToRun() async {
    Future.delayed(const Duration(seconds: 7))
        .then((value) => navigateToHome());
  }

  void navigateToHome() {
    serviceLocator<INavigationService>()
        .pushReplacementNamed(RoutePaths.bottomTabBar);
  }
}
