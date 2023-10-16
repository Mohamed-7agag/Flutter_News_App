import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  List<Article> articles;

  Articles({
    required this.articles,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      articles:
          List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  String title;
  dynamic description;
  String url;
  dynamic urlToImage;
  String publishedAt;
  Article(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"],
      description: json["description"] == null ? null : json['description'],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: json['publishedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
      };
}
