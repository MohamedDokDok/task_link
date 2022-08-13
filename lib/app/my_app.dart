import 'package:flutter/material.dart';
import 'package:link_task/shared/routes/routes_generator.dart';
import 'package:link_task/shared/routes/routes_strings.dart';
import 'package:link_task/shared/theme/light_theme.dart';

class LinkTaskApp extends StatelessWidget {
  final RouteGenerator routeGenerator;
  const LinkTaskApp({Key? key, required this.routeGenerator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeGenerator.getRoute,
      initialRoute: AppRoutes.homeRoute,
      theme: getLightTheme(),
      themeMode: ThemeMode.light,
    );
  }
}
