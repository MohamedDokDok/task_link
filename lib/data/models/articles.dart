class Articles {
  String? status;
  int? totalResults;
  List<ArticlesList>? articles;


  Articles.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticlesList>[];
      json['articles'].forEach((v) {
        articles!.add(ArticlesList.fromJson(v));
      });
    }
  }

}

class ArticlesList {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;


  ArticlesList.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }


}

class Source {
  String? id;
  String? name;

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}
