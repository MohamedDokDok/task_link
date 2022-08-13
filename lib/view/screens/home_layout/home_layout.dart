import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/app_fonts.dart';
import 'package:link_task/shared/app_values.dart';
import 'package:link_task/shared/assets_manager/images_manager.dart';
import 'package:link_task/shared/strings.dart';
import 'package:link_task/shared/styles/montserrat_style.dart';
import 'package:link_task/view/widgets/app_bar.dart';
import 'package:link_task/view/widgets/drawer.dart';
import 'package:link_task/view_model/articles_cubit/articles_cubit.dart';

import '../../../shared/routes/routes_strings.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        ArticlesCubit cubit = ArticlesCubit.get(context);
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBarWidget(
            title: cubit.titleAppBart(),
            icon: Icons.search,
            onPressIcon: () {
              Navigator.pushNamed(
                context,
                AppRoutes.searchRoute,
              );
              ArticlesCubit.get(context).articlesSearched.clear();
            },
          ),
          body: cubit.checkInternet(
            widget: ArticlesCubit.get(context)
                .screens[ArticlesCubit.get(context).index],
          ),
        );
      },
    );
  }
}
