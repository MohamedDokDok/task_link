import 'package:flutter/material.dart';
import 'package:link_task/shared/routes/routes_generator.dart';
import 'package:link_task/shared/routes/routes_strings.dart';
import 'package:link_task/shared/theme/light_theme.dart';

import '../view/windows_screens/articles_screen.dart';

class LinkTaskApp extends StatefulWidget {
  final RouteGenerator routeGenerator;
  const LinkTaskApp({Key? key, required this.routeGenerator}) : super(key: key);

  @override
  State<LinkTaskApp> createState() => _LinkTaskAppState();
}

class _LinkTaskAppState extends State<LinkTaskApp> {



  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.routeGenerator.getRoute,
      initialRoute: AppRoutes.homeRoute,
      theme: getLightTheme(),
      themeMode: ThemeMode.light,
    );
  }
}
