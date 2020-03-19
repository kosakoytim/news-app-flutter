class ArticleBasicInfo {
  String id;
  String title;
  String thumbnail;
  String publisher;

  ArticleBasicInfo({this.id, this.title, this.thumbnail, this.publisher});

  factory ArticleBasicInfo.fromMap(Map<String, dynamic> json) {
    return ArticleBasicInfo(
      id: json['id'],
      publisher: json['publisher'],
      thumbnail: json['thumbnail'],
      title: json['title']
    );
  }
}

class ArticleDetail implements ArticleBasicInfo {
  List<dynamic> content;
  String publishTime;
  String url;
  String id;
  String publisher;
  String thumbnail;
  String title;

  ArticleDetail({this.content, this.publishTime, this.url, this.id, this.publisher, this.thumbnail, this.title});

  factory ArticleDetail.fromMap(Map<String, dynamic> json) {
    return ArticleDetail(
      content: json['content'],
      id: json['id'],
      publisher: json['publisher'],
      publishTime: json['publishTime'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      url: json['url']
    );
  }
  
}