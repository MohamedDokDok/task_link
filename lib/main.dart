import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:link_task/app/my_app.dart';
import 'package:link_task/shared/lang/lang_manager.dart';
import 'package:link_task/shared/routes/routes_generator.dart';
import 'package:link_task/view_model/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      child: Phoenix(
        child: LinkTaskApp(
          routeGenerator: RouteGenerator(),
        ),
      )));
}
