import 'package:flutter/material.dart' hide Router;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Configs/theme.dart';
import 'package:movie_app/UI/router.dart';
import 'package:movie_app/UI/serviceLocator.dart';

import '../Core/Services/Navigation/iNavigationService.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: RoutePaths.splash,
      navigatorKey: serviceLocator<INavigationService>()
          .navigatorKeys[NavigationFlow.Default],
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: themeData,
    );
  }
}
