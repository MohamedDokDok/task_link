import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../strings.dart';

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.noRouteFound.tr(),
        ),
      ),
      body: Center(
        child: Text(
          AppStrings.noRouteFound.tr(),
        ),
      ),
    ),
  );
}
