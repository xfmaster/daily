//"id": 589058,
//"description": "写字的，关心出版、知识和人。邮箱 menglong.zeng@qdaily.com",
//"avatar": "http://img.qdaily.com/user/face/20160704142930nzaTbi0pcf17ULtu.jpg?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/format/jpg/ignore-error/1",
//"name": "曾梦龙",
//"background_image":
import 'package:daily_app/bean/base.dart';
import 'package:daily_app/bean/news_bean.dart';

class AuthorBean extends BaseBean<NewsBean, Author> {
  AuthorBean(
      lastKey, bool hasMore, List<NewsBean> list, Author p, bool isRefresh)
      : super(lastKey, hasMore, list, p, isRefresh);
}

class Author {
  int id;
  String description;
  String avatar;
  String name;
  String background_image;
  List<SpecialColumn> special_column;

  Author(
      {this.id,
      this.description,
      this.avatar,
      this.name,
      this.background_image,
      this.special_column});

  factory Author.fromJson(Map<String, dynamic> json) {
    List<SpecialColumn> list;
    if (json.containsKey('special_column')) {
      list = new List();
      var jsonArray = json['special_column'];
      for (int i = 0; i < jsonArray.length; i++) {
        list.add(SpecialColumn.fromJson(jsonArray[i]));
      }
    }
    return new Author(
        id: json['id'],
        description: json['description'],
        avatar: json['avatar'],
        name: json['name'],
        special_column: list);
  }
}

class SpecialColumn {
  int id;
  String name;
  String description;
  bool subscribe_status;
  String icon;
  String image;
  String image_large;
  String content_provider;
  int show_type;
  int genre;
  int subscriber_num;
  int post_count;
  String sort_time;
  String column_tag;
  int location;

  SpecialColumn(
      {this.id,
      this.name,
      this.description,
      this.subscribe_status,
      this.icon,
      this.image,
      this.image_large,
      this.content_provider,
      this.show_type,
      this.genre,
      this.subscriber_num,
      this.post_count,
      this.sort_time,
      this.column_tag,
      this.location});

  factory SpecialColumn.fromJson(Map<String, dynamic> json) {
    return new SpecialColumn(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      subscribe_status: json['subscribe_status'],
      icon: json['icon'],
      image: json['image'],
      image_large: json['image_large'],
      content_provider: json['content_provider'],
      show_type: json['show_type'],
      genre: json['genre'],
      subscriber_num: json['subscriber_num'],
      post_count: json['post_count'],
      sort_time: json['sort_time'],
      column_tag: json['column_tag'],
      location: json['location'],
    );
  }
}
