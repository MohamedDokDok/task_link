import 'package:flutter/material.dart';

import '../strings.dart';

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.noRouteFound,
        ),
      ),
      body: const Center(
        child: Text(
          AppStrings.noRouteFound,
        ),
      ),
    ),
  );
}
