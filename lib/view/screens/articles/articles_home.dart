import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/shared/app_values.dart';
import 'package:link_task/view/widgets/card_view.dart';
import 'package:link_task/view_model/articles_cubit/articles_cubit.dart';

import '../../../data/models/articles.dart';
import '../../../shared/strings.dart';
import '../../widgets/button.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {

  _ArticlesBuilder(List<ArticlesList> article) => Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => CardView(
                        imgURL: "${article[index].urlToImage}",
                        title: "${article[index].title}",
                        publisher: article[index].author ?? "Unknown",
                        date: "${article[index].publishedAt}",
                        articleUrl: "${article[index].url}",
                        articleDescription: "${article[index].description}",
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppSize.s8),
                  itemCount: article.length),
            )
          ],
        ),
      );

  @override
  void initState() {
    if(ArticlesCubit.get(context).temp && !ArticlesCubit.get(context).isLoaded) {
      ArticlesCubit.get(context).getAllArticles();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var article = ArticlesCubit.get(context);
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        return article.isLoaded
            ? _ArticlesBuilder(article.articles)
            : const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
