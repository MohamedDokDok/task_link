import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/app/my_app.dart';
import 'package:link_task/shared/routes/routes_generator.dart';
import 'package:link_task/view_model/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(LinkTaskApp(
    routeGenerator: RouteGenerator(),
  ));
}
