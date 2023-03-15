import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:link_task/data/models/articles.dart';
import 'package:link_task/shared/enum_generation.dart';
import 'package:link_task/shared/strings.dart';
import 'package:link_task/view/screens/articles/articles_home.dart';
import 'package:link_task/view/screens/explore_news/explore_news_screen.dart';
import 'package:link_task/view/screens/gallery/gallery_screen.dart';
import 'package:link_task/view/screens/live_chat/live_chat_screen.dart';
import 'package:link_task/view/screens/no_internet/no_internet_screen.dart';
import 'package:link_task/view/screens/wish_list/wish_list_screen.dart';
import 'package:link_task/view/widgets/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/repository/articles_repository.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticlesRepository articlesRepository;
  ArticlesCubit({required this.articlesRepository}) : super(ArticlesInitial());

  static ArticlesCubit get(context) => BlocProvider.of(context);

  List<ArticlesList> articles = [];
  bool isLoaded = false;
  bool temp = false;

  void getAllArticles() {
    emit(ArticlesLoadingState());
    isLoaded = false;
    articlesRepository.getAllArticles().then((articles) {
      this.articles = articles.articles!;
      //print("articles in Cubit ${articles.articles!.length}");
      isLoaded = true;
      emit(ArticlesLoadingSuccessState());
    }).catchError((error) {
      //print("Error in Cubit ${error.toString()}");
      emit(ArticlesLoadingErrorState());
    });
  }

  List<ArticlesList> articlesSearched = [];
  void getArticlesSearched({required String txtSearch}) {
    emit(ArticlesSearchedLoadingState());
    isLoaded = false;
    articlesRepository
        .getArticlesSearched(txtSearch: txtSearch)
        .then((articlesSearched) {
      this.articlesSearched = articlesSearched.articles!;
      //print("articles in Cubit Search ${articlesSearched.articles!.length}");
      isLoaded = true;
      emit(ArticlesSearchedLoadingSuccessState());
    }).catchError((error) {
      //print("Error in Cubit ${error.toString()}");
      emit(ArticlesSearchedLoadingErrorState());
    });
  }

  Widget checkInternet({required Widget widget}) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return widget;
        } else {
          temp =true;
          return const NoInternetBody();
        }
      },
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  int index = 0;
  void changeIndex({required int index}) {
    this.index = index;
    emit(ChangeIndexState());
  }

  List<Widget> screens = [
    const ArticlesScreen(),
    const ExploreOnlineNewsScreen(),
    const GalleryScreen(),
    const LiveChatScreen(),
    const WishListScreen()
  ];


  String titleAppBart() {
    if (index == 0) {
      return AppStrings.articles.tr();
    } else if (index == 1) {
      return AppStrings.liveChat.tr();
    } else if (index == 2) {
      return AppStrings.gallery.tr();
    } else if (index == 3) {
      return AppStrings.wishList.tr();
    } else {
      return AppStrings.exploreOnlineNews.tr();
    }
  }


}
