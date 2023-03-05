import 'package:flutter/material.dart';
import 'package:movie_app/UI/MyApp.dart';
import 'package:movie_app/UI/serviceLocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(const MyApp());
}
