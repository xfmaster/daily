import 'package:daily_app/bean/news_bean.dart';

class LabBean {
  List<NewsBean> feeds;
  List<Topic> paper_topics;
  bool has_more;
  int last_key;

  LabBean({this.feeds, this.paper_topics, this.has_more, this.last_key});
}

class Topic {
  int id;
  int insert_location;
  List<TopicColumn> topics;

  Topic({this.id, this.insert_location, this.topics});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return new Topic(
      id: json['id'],
      insert_location: json['insert_location'],
      topics: TopicColumn.fromJsonList(json['insert_content']),
    );
  }
}

//{
//"id": 8,
//"icon": "http://img.qdaily.com/topic/icon/20170320181911ZQLuT6niG52RK39q.jpg?imageMogr2/auto-orient/thumbnail/108x110/gravity/Center/crop/108x110/quality/85/format/jpg/ignore-error/1",
//"title": "Top 10",
//"description": "每月参与量最高的话题精选",
//"image": "http://img.qdaily.com/topic/topic/20170320182050SxngXpaRVOKl6F0A.jpg?imageMogr2/auto-orient/thumbnail/!960x528r/gravity/Center/crop/960x528/quality/85/format/jpg/ignore-error/1"
//},
class TopicColumn {
  int id;
  String icon;
  String title;
  String description;
  String image;

  TopicColumn({this.id, this.icon, this.title, this.description, this.image});

  factory TopicColumn.fromJson(Map<String, dynamic> json) {
    return new TopicColumn(
      id: json['id'],
      icon: json['icon'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }

  static List<TopicColumn> fromJsonList(var jsonArray) {
    List<TopicColumn> list = new List();
    for (int i = 0; i < jsonArray.length; i++) {
      var json = jsonArray[i];
      list.add(new TopicColumn(
        id: json['id'],
        icon: json['icon'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
      ));
    }
    return list;
  }
}
