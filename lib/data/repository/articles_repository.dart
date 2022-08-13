import 'package:link_task/data/data_provider/remote/articles_web_services.dart';
import 'package:link_task/data/models/articles.dart';

class ArticlesRepository{
  final ArticlesWebServices articlesWebServices;

  ArticlesRepository({required this.articlesWebServices});

  Future<Articles> getAllArticles() async{
    final articles = await articlesWebServices.getAllArticles();
    return Articles.fromJson(articles);
  }

  Future<Articles> getArticlesSearched({
  required String txtSearch
}) async{
    final articles = await articlesWebServices.getArticlesSearched(txtSearch: txtSearch);
    return Articles.fromJson(articles);
  }
}