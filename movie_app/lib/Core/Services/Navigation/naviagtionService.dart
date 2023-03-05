import 'package:flutter/material.dart';
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';

class NavigationService implements INavigationService {
  @override
  void pop<T>({T? arguments, NavigationFlow? navigationFlow}) {
    final navigatorKey = _getNavigatorKey(navigationFlow: navigationFlow);

    return navigatorKey!.currentState?.pop(arguments);
  }

  @override
  void popUntil(String routeName, {arguments, NavigationFlow? navigationFlow}) {
    final navigatorKey = _getNavigatorKey(navigationFlow: navigationFlow);

    navigatorKey!.currentState!.popUntil((r) => r.isFirst);
  }

  @override
  Future<T>? pushNamed<T, S>(String routeName,
      {S? arguments, NavigationFlow? navigationFlow}) {
    final navigatorKey = _getNavigatorKey(navigationFlow: navigationFlow);

    return navigatorKey!.currentState!
        .pushNamed(routeName, arguments: arguments) as Future<T>?;
  }

  @override
  Future<T>? pushNamedAndRemoveUntil<T, S>(String routeName,
      {S? arguments, NavigationFlow? navigationFlow}) {
    final navigatorKey = _getNavigatorKey(navigationFlow: navigationFlow);

    return navigatorKey!.currentState?.pushNamedAndRemoveUntil(
            routeName, (Route<dynamic> route) => false, arguments: arguments)
        as Future<T>?;
  }

  @override
  Map<NavigationFlow, GlobalKey<NavigatorState>> navigatorKeys = {
    NavigationFlow.Default: GlobalKey<NavigatorState>(),
    NavigationFlow.Watch: GlobalKey<NavigatorState>(),
    NavigationFlow.MediaLibrary: GlobalKey<NavigatorState>(),
    NavigationFlow.More: GlobalKey<NavigatorState>(),
  };

  GlobalKey<NavigatorState>? _getNavigatorKey(
      {NavigationFlow? navigationFlow}) {
    if (navigationFlow == null) return navigatorKeys[NavigationFlow.Default];
    return navigatorKeys[navigationFlow];
  }

  @override
  Future<T>? pushReplacementNamed<T, S>(String routeName,
      {S? arguments, NavigationFlow? navigationFlow}) {
    final navigatorKey = _getNavigatorKey(navigationFlow: navigationFlow);

    return navigatorKey!.currentState!
        .pushReplacementNamed(routeName, arguments: arguments) as Future<T>?;
  }
}
