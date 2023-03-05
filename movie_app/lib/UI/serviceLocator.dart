import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/Core/Configs/MovieApiUrls.dart';
import 'package:movie_app/Core/Services/Movies/iMovieService.dart';
import 'package:movie_app/Core/Services/Movies/movieService.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:movie_app/Core/Services/Navigation/naviagtionService.dart';

import 'package:movie_app/Core/ViewModel/Bottom%20Tab%20Bar%20View%20Model/bottomTabBarViewModel.dart';
import 'package:movie_app/Core/ViewModel/Search%20View%20Model/searchResultViewModel.dart';
import 'package:movie_app/Core/ViewModel/Search%20View%20Model/searchViewModel.dart';
import 'package:movie_app/Core/ViewModel/Watch%20View%20Model/movieDetailsViewModel.dart';
import 'package:movie_app/Core/ViewModel/Watch%20View%20Model/watchViewModel.dart';
import 'package:movie_app/Core/ViewModel/splash%20View%20Model/splashViewModel.dart';

final serviceLocator = GetIt.instance;

Future<void> _registerServices() async {
  serviceLocator.registerLazySingleton<Client>(() => Client());

  serviceLocator
      .registerLazySingleton<INavigationService>(() => NavigationService());
  serviceLocator.registerLazySingleton<IMovieService>(() => MovieService());
}

void _registerViewModels() {
  serviceLocator.registerFactory(() => SplashViewModel());

  serviceLocator.registerFactory(() => BottomTabBarViewModel());

  serviceLocator.registerFactory(() => WatchViewModel(
      serviceLocator<IMovieService>(), serviceLocator<INavigationService>()));
  serviceLocator.registerFactory(() => MovieDetailsViewModel());
  serviceLocator.registerFactory(() => SearchViewModel(
      serviceLocator<IMovieService>(), serviceLocator<INavigationService>()));
  serviceLocator.registerFactory(() => SearchResultViewModel());
}

Future<void> setupServiceLocator() async {
  await _registerServices();
  _registerViewModels();
}
