//{
//    "id": 348416,
//    "content": "工作啊，无非就是把我变成了一个深居简出的山顶洞人（深居六楼无电梯）",
//    "image": "",
//    "praise_count": 3,
//    "perfect": 0,
//    "author": {
//        "id": 1267956,
//        "description": null,
//        "avatar": "http://img.qdaily.com/user/face/20180222171527yzr2f8ihXa3gAjKE.jpg?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/format/jpg/ignore-error/1",
//        "name": "聚往矣",
//        "background_image": "http://app3.qdaily.com/default_images/missing_loading.jpg"
//    }
//}
import 'package:daily_app/bean/news_bean.dart';

class Question {
  List<QuestionBean> list ;
  NewsBean newsBean;

  Question(this.list, this.newsBean);
}

class QuestionBean {
  int id;
  String content;
  String image;
  int praise_count;
  int perfect;
  Author author;

  QuestionBean(
      {this.id,
      this.content,
      this.image,
      this.praise_count,
      this.perfect,
      this.author});

  factory QuestionBean.fromJson(Map<String, dynamic> json) {
    return QuestionBean(
      id: json['id'],
      content: json['content'],
      image: json['image'],
      praise_count: json['praise_count'],
      perfect: json['perfect'],
      author: Author.fromJson(json['author']),
    );
  }
}

class Author {
  int id;
  String description;
  String avatar;
  String name;
  String background_image;

  Author(
      {this.id,
      this.description,
      this.avatar,
      this.name,
      this.background_image});

  factory Author.fromJson(Map<String, dynamic> json) {
    return new Author(
      id: json["id"],
      description: json["description"],
      avatar: json["avatar"],
      name: json["name"],
      background_image: json["background_image"],
    );
  }
}
