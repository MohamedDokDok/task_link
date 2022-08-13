import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/data/models/articles.dart';
import 'package:link_task/shared/app_color/app_color.dart';
import 'package:link_task/shared/app_fonts.dart';
import 'package:link_task/shared/app_values.dart';
import 'package:link_task/shared/strings.dart';
import 'package:link_task/shared/styles/montserrat_style.dart';
import 'package:link_task/view/widgets/card_view.dart';
import 'package:link_task/view/widgets/text_form_filed.dart';

import '../../../view_model/articles_cubit/articles_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController txtSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          ArticlesCubit cubit = ArticlesCubit.get(context);
          return SafeArea(
            child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: AppPadding.p16,
                  end: AppPadding.p14,
                  start: AppPadding.p14,
                ),
                child: cubit.checkInternet(
                  widget: _searchScreen(
                    context: context,
                    cubit: cubit,
                  ),
                )),
          );
        },
      ),
    );
  }

  _searchScreen(
          {required BuildContext context, required ArticlesCubit cubit}) =>
      Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.articlesSearched.clear();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.primary,
                  size: AppSize.s20,
                ),
              ),
              Expanded(
                child: MyTextFormFiled(
                  controller: txtSearchController,
                  hintLabel: AppStrings.search,
                  emptyFiledTitle: AppStrings.searchError,
                  onChange: (String? txtSearch) {
                    if (txtSearch!.length > 2) {
                      cubit.getArticlesSearched(
                          txtSearch: txtSearchController.text);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s14),
          if (ArticlesCubit.get(context).articlesSearched.isEmpty &&
              ArticlesCubit.get(context).isLoaded)
            Expanded(
              flex: 8,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    AppStrings.searchNow,
                    textStyle: getBoldStyle(
                        textColor: AppColor.black,
                        fontSize: FontsSizeManager.s18),
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ),
          if (ArticlesCubit.get(context).isLoaded)
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => CardView(
                          imgURL: "${cubit.articlesSearched[index].urlToImage}",
                          title: "${cubit.articlesSearched[index].title}",
                          publisher: "${cubit.articlesSearched[index].author}",
                          date: "${cubit.articlesSearched[index].publishedAt}",
                          articleUrl: "${cubit.articlesSearched[index].url}",
                          articleDescription:
                              "${cubit.articlesSearched[index].description}",
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: AppSize.s4,
                        ),
                    itemCount: cubit.articlesSearched.length))
          else
            Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: LinearProgressIndicator(backgroundColor: AppColor.white),
            )
        ],
      );
}
