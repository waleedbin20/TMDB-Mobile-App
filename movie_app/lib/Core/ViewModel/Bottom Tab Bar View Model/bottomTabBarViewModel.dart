import 'package:flutter/material.dart';
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:movie_app/UI/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class BottomTabBarViewModel extends ReactiveViewModel {
  TabItem currentTab = TabItem.Watch;
  final navigatorKeys = {
    TabItem.Watch: serviceLocator<INavigationService>()
        .navigatorKeys[NavigationFlow.Watch],
    TabItem.Dashboard: serviceLocator<INavigationService>()
        .navigatorKeys[NavigationFlow.Dashboard],
    TabItem.More:
        serviceLocator<INavigationService>().navigatorKeys[NavigationFlow.More],
  };

  void onTapped(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.Dashboard:
        if (tabItem != currentTab) {
          currentTab = tabItem;
          notifyListeners();
        }
        break;
      case TabItem.Watch:
        if (tabItem != currentTab) {
          currentTab = tabItem;
          notifyListeners();
        }
        break;
      case TabItem.More:
        if (tabItem != currentTab) {
          currentTab = tabItem;
          notifyListeners();
        }
        break;
    }
  }

  String initialRoute(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.Dashboard:
        return RoutePaths.dashboard;
      case TabItem.Watch:
        return RoutePaths.watch;
      case TabItem.More:
        return RoutePaths.more;
    }
  }

  GlobalKey<NavigatorState> navigatorKey(TabItem tabItem) {
    return navigatorKeys[tabItem]!;
  }

  Future<bool> handleHardwareBackButton() async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[currentTab]!.currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (currentTab != TabItem.Dashboard) {
        currentTab = TabItem.Dashboard;
        notifyListeners();
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}
