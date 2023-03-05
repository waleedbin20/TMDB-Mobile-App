import 'package:flutter/material.dart';
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/Models/movieUpcomingModel.dart';
import 'package:movie_app/UI/Views/Bottom%20Tab%20Bar/bottomTabBarView.dart';
import 'package:movie_app/UI/Views/Dashboard/dashboardView.dart';
import 'package:movie_app/UI/Views/Media%20Library/mediaView.dart';
import 'package:movie_app/UI/Views/More/moreView.dart';
import 'package:movie_app/UI/Views/Search/searchResultView.dart';
import 'package:movie_app/UI/Views/Search/searchView.dart';
import 'package:movie_app/UI/Views/Watch/movieDetails.dart';
import 'package:movie_app/UI/Views/Watch/watchView.dart';
import 'package:movie_app/UI/Views/splash/splashView.dart';
import 'package:tuple/tuple.dart';

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
      case RoutePaths.watch:
        return MaterialPageRoute<T>(
          builder: (_) => WatchView(),
          settings: settings,
        );
      case RoutePaths.more:
        return MaterialPageRoute<T>(
          builder: (_) => const MoreView(),
          settings: settings,
        );
      case RoutePaths.dashboard:
        return MaterialPageRoute<T>(
          builder: (_) => const DashboardView(),
          settings: settings,
        );
      case RoutePaths.mediaLibrary:
        return MaterialPageRoute<T>(
          builder: (_) => const MediaView(),
          settings: settings,
        );
      case RoutePaths.search:
        final navigationFlow = settings.arguments as NavigationFlow;
        return MaterialPageRoute<T>(
          builder: (_) => SearchView(
            navigationFlow: navigationFlow,
          ),
          settings: settings,
        );
      case RoutePaths.movieDetails:
        {
          final arguments = settings.arguments;
          if (arguments is Tuple2<MovieDetails?, NavigationFlow?>) {
            return MaterialPageRoute<T>(
                builder: (_) => MovieDetailsView(
                      movieDetails: arguments.item1,
                      navigationFlow: arguments.item2,
                    ),
                settings: settings);
          } else if (arguments is Tuple2<MovieDetails, NavigationFlow>) {
            final movieDetails = arguments.item1;
            final navigationFlow = arguments.item2;
            final updatedArguments = Tuple2<MovieDetails?, NavigationFlow?>(
                movieDetails, navigationFlow);
            return MaterialPageRoute<T>(
                builder: (_) => MovieDetailsView(
                      movieDetails: updatedArguments.item1,
                      navigationFlow: updatedArguments.item2,
                    ),
                settings: settings);
          } else {
            throw ArgumentError(
                "Invalid argument type for movieDetails route.");
          }
        }

      case RoutePaths.searchResult:
        {
          final arguments = settings.arguments;
          if (arguments is Tuple2<MovieUpcomingModel?, NavigationFlow?>) {
            return MaterialPageRoute<T>(
                builder: (_) => SearchResultView(
                      movieDetails: arguments.item1,
                      navigationFlow: arguments.item2,
                    ),
                settings: settings);
          } else if (arguments is Tuple2<MovieUpcomingModel, NavigationFlow>) {
            final movieDetails = arguments.item1;
            final navigationFlow = arguments.item2;
            final updatedArguments =
                Tuple2<MovieUpcomingModel?, NavigationFlow?>(
                    movieDetails, navigationFlow);
            return MaterialPageRoute<T>(
                builder: (_) => SearchResultView(
                      movieDetails: updatedArguments.item1,
                      navigationFlow: updatedArguments.item2,
                    ),
                settings: settings);
          } else {
            throw ArgumentError(
                "Invalid argument type for Search Result route.");
          }
        }

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
