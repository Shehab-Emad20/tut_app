import 'package:flutter/material.dart';
import 'package:tut_app/utils/routes_manager.dart';
import '../utils/theme_manger.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}
