import 'package:flutter/material.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/UI/Views/Bottom%20Tab%20Bar/bottomTabBarView.dart';
import 'package:movie_app/UI/Views/More/moreView.dart';
import 'package:movie_app/UI/Views/splash/splashView.dart';

class Router {
  static Route<T> generateRoute<T>(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute<T>(
          builder: (_) => const SplashView(),
          settings: settings,
        );

      case RoutePaths.bottomTabBar:
        return MaterialPageRoute<T>(
          builder: (_) => const BottomTabBarView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<T>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }

  static Route<T> generateRouteMore<T>(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.more:
        return MaterialPageRoute<T>(
          builder: (_) => const Moreview(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<T>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
