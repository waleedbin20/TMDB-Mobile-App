import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:movie_app/Core/Services/Navigation/naviagtionService.dart';
import 'package:movie_app/Core/ViewModel/Bottom%20Tab%20Bar%20View%20Model/bottomTabBarViewModel.dart';
import 'package:movie_app/Core/ViewModel/splash%20View%20Model/splashViewModel.dart';

final serviceLocator = GetIt.instance;

Future<void> _registerServices() async {
  serviceLocator.registerLazySingleton<Client>(() => Client());

  serviceLocator
      .registerLazySingleton<INavigationService>(() => NavigationService());
}

void _registerViewModels() {
  serviceLocator.registerFactory(() => SplashViewModel());

  serviceLocator.registerFactory(() => BottomTabBarViewModel());
}

Future<void> setupServiceLocator() async {
  await _registerServices();
  _registerViewModels();
}
