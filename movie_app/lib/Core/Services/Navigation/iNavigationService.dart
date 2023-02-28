import 'package:flutter/material.dart';
import 'package:movie_app/Core/Configs/enum.dart';

abstract class INavigationService {
  late Map<NavigationFlow, GlobalKey<NavigatorState>> navigatorKeys;
  Future<T>? pushNamed<T, S>(String routeName,
      {S? arguments, NavigationFlow? navigationFlow});
  Future<T>? pushNamedAndRemoveUntil<T, S>(String routeName,
      {S? arguments, NavigationFlow? navigationFlow});
  void pop<T>({T? arguments, NavigationFlow? navigationFlow});
  void popUntil(String routeName,
      {dynamic arguments, NavigationFlow? navigationFlow});
  Future<T>? pushReplacementNamed<T, S>(String routeName,
      {S? arguments, NavigationFlow? navigationFlow});
}
