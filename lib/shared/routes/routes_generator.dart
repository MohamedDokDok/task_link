import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/data/data_provider/remote/articles_web_services.dart';
import 'package:link_task/data/models/articles.dart';
import 'package:link_task/data/repository/articles_repository.dart';
import 'package:link_task/view/screens/articles/articles_home.dart';
import 'package:link_task/view/screens/articles_details/articles_details.dart';
import 'package:link_task/view/screens/explore_news/explore_news_screen.dart';
import 'package:link_task/view/screens/home_layout/home_layout.dart';
import 'package:link_task/view/screens/live_chat/live_chat_screen.dart';
import 'package:link_task/view/screens/search/search_screen.dart';
import 'package:link_task/view/screens/wish_list/wish_list_screen.dart';
import 'package:link_task/view_model/articles_cubit/articles_cubit.dart';

import '../../view/screens/gallery/gallery_screen.dart';
import 'routes_strings.dart';
import 'un_defined_route.dart';

class RouteGenerator {
  late ArticlesRepository articlesRepository;
  late ArticlesCubit articlesCubit;

  RouteGenerator() {
    articlesRepository =
        ArticlesRepository(articlesWebServices: ArticlesWebServices());
    articlesCubit = ArticlesCubit(articlesRepository: articlesRepository);
  }

  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => articlesCubit..getAllArticles(),
                  child: const HomeLayoutScreen(),
                ));
      case AppRoutes.articlesDetailsRoute:
        final article = settings.arguments as ArticlesDetailsScreen;
        return MaterialPageRoute(
            builder: (context) => ArticlesDetailsScreen(
              title: article.title,
              articleUrl: article.articleUrl,
              imgURL: article.imgURL ,
              publisher: article.publisher,
              articleDescription: article.articleDescription == "null" ? "No Description": article.articleDescription,
              date: article.date,
                ));
      case AppRoutes.searchRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: articlesCubit,
            child: SearchScreen(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }
}
