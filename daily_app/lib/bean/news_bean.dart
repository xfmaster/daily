class Data {
  bool has_more;
  String last_key;
  NewsListBean newsListBean;

  Data(this.has_more, this.last_key, this.newsListBean);
}

class ColumnData {
  bool has_more;
  int last_key;
  int location;
  List<NewsBean> list;
  Column column;
  double width;

  ColumnData(this.has_more, this.last_key, this.location, this.column,
      this.list, this.width);
}

class ColumnList {
  bool has_more;
  int last_key;
  List<NewsBean> beans;
  final bool isLoad;

  ColumnList(this.has_more, this.last_key, this.beans, {this.isLoad = false});
}

class NewsListBean {
  List<NewsBean> feeds;
  List<NewsBean> banners;
  List<Column> columns;

  NewsListBean(this.banners, this.feeds, this.columns);
}

class NewsBean {
  String image;
  int type;
  Post post;

  NewsBean({this.type, this.image, this.post});

  factory NewsBean.fromJson(Map<String, dynamic> json) {
    return new NewsBean(
      type: json['type'],
      image: json['image'],
      post: Post.fromJson(json['post']),
    );
  }
}

class Post {
  int id;
  String image;
  String title;
  String description;
  int comment_count;
  int praise_count;
  bool comment_status;
  String appview;
  String datatype;
  Column column;
  int publish_time;
  int record_count;
  int genre;
  int pageStyle;
  Category category;

  Post({
    this.id,
    this.image,
    this.title,
    this.description,
    this.record_count,
    this.comment_count,
    this.praise_count,
    this.genre,
    this.publish_time,
    this.comment_status,
    this.pageStyle,
    this.appview,
    this.datatype,
    this.column,
    this.category,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      comment_count: json['comment_count'],
      praise_count: json['praise_count'],
      comment_status: json['comment_status'],
      publish_time: json['publish_time'],
      appview: json['appview'],
      record_count: json['record_count'],
      datatype: json['datatype'],
      pageStyle: json['page_style'],
      genre: json['genre'],
      column:
          json.containsKey('column') ? Column.fromJson(json['column']) : null,
      category: json.containsKey('category')
          ? Category.fromJson(json['category'])
          : null,
    );
  }
}

class Column {
  int id;
  String name;
  String icon;
  String image;
  String description;
  int comment_count;
  int praise_count;
  bool subscribe_status;
  String content_provider;
  int subscriber_num;
  int show_type;
  int post_count;
  String image_large;
  int location;
  int genre;

  Column(
      {this.id,
      this.name,
      this.icon,
      this.image,
      this.description,
      this.comment_count,
      this.praise_count,
      this.subscribe_status,
      this.content_provider,
      this.subscriber_num,
      this.show_type,
      this.post_count,
      this.image_large,
      this.location,
      this.genre});

  factory Column.fromJson(Map<String, dynamic> json) {
    return new Column(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      image: json['image'],
      description: json['description'],
      comment_count: json['comment_count'],
      praise_count: json['praise_count'],
      subscribe_status: json['subscribe_status'],
      content_provider: json['content_provider'],
      subscriber_num: json['subscriber_num'],
      show_type: json['show_type'],
      post_count: json['post_count'],
      image_large: json['image_large'],
      location: json['location'],
      genre: json['genre'],
    );
  }
}

class Category {
  int id; // 18,
  String title;
  String
      normal; //": "http://img.qdaily.com/category/icon_black/20160606004538naArie0HoIZFOLpN.png?imageMogr2/auto-orient/thumbnail/!128x128r/gravity/Center/crop/128x128/quality/85/ignore-error/1",
  String
      normal_hl; //": "http://img.qdaily.com/category/icon_yellow_app/20160606004539qDxRAKMYwQfucvCP.png?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/ignore-error/1",
  String
      image_lab; //": "http://img.qdaily.com/category/icon_yellow_app/20160606004539qDxRAKMYwQfucvCP.png?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/ignore-error/1",
  String image_experiment;

  Category(
      {this.id,
      this.title,
      this.normal,
      this.normal_hl,
      this.image_lab,
      this.image_experiment}); //": ""
  factory Category.fromJson(Map<String, dynamic> json) {
    return new Category(
      id: json['id'],
      title: json['title'],
      normal: json['normal'],
      normal_hl: json['normal_hl'],
      image_lab: json['image_lab'],
      image_experiment: json['image_experiment'],
    );
  }
}
//{
//"image": "http://img.qdaily.com/article/article_show/201910180824034FkEUgQxfH5Ke9vr.jpg?imageMogr2/auto-orient/thumbnail/!640x380r/gravity/Center/crop/640x380/quality/85/format/jpg/ignore-error/1",
//"type": 2,
//"post": {
//"id": 64667,
//"genre": 1,
//"title": "如何正确地做自我介绍， 6 个模板供你参考 | 100个生活大问题",
//"description": "一切都是我。",
//"publish_time": 1571459048,
//"image": "http://img.qdaily.com/article/article_show/201910180824034FkEUgQxfH5Ke9vr.jpg?imageMogr2/auto-orient/thumbnail/!640x380r/gravity/Center/crop/640x380/quality/85/format/jpg/ignore-error/1",
//"start_time": 0,
//"comment_count": 14,
//"comment_status": true,
//"praise_count": 256,
//"super_tag": "长文章",
//"page_style": 1,
//"post_id": 67691,
//"appview": "http://app3.qdaily.com/app3/articles/64667.html",
//"film_length": "",
//"datatype": "article",
//"category": {
//"id": 3,
//"title": "娱乐",
//"normal": "http://img.qdaily.com/category/icon_black/2016060600453051OLjs0UP4XVSoFv.png?imageMogr2/auto-orient/thumbnail/!128x128r/gravity/Center/crop/128x128/quality/85/ignore-error/1",
//"normal_hl": "http://img.qdaily.com/category/icon_yellow_app/20160606004531TgJK5XPy61qfS7rN.png?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/ignore-error/1",
//"image_lab": "http://img.qdaily.com/category/icon_yellow_app/20160606004531TgJK5XPy61qfS7rN.png?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/ignore-error/1",
//"image_experiment": ""
//},
//"column": {
//"id": 63,
//"name": "100 个生活大问题",
//"description": "我们关注那些当代人类细枝末节又无比重要的生活动态，就是“哎你们最近发现没有”类话题。",
//"subscribe_status": true,
//"icon": "http://img.qdaily.com/special_column/icon/20180723151452Ly0SxdWNl6jRQ4wZ.png?imageMogr2/auto-orient/thumbnail/!128x128r/gravity/Center/crop/128x128/quality/85/format/jpg/ignore-error/1",
//"image": "http://img.qdaily.com/special_column/column/20180723152006VsRjKwHkMXZg5QDG.jpg?imageMogr2/auto-orient/thumbnail/!320x320r/gravity/Center/crop/320x320/quality/85/format/jpg/ignore-error/1",
//"image_large": "http://img.qdaily.com/special_column/column/20180723152006VsRjKwHkMXZg5QDG.jpg?imageMogr2/auto-orient/thumbnail/!750x604r/gravity/Center/crop/750x604/quality/85/format/jpg/ignore-error/1",
//"content_provider": "好奇心日报",
//"show_type": 1,
//"genre": 1,
//"subscriber_num": 29877,
//"post_count": 45,
//"sort_time": "2019-10-19 12:24:08 +0800",
//"column_tag": "special_columns_63",
//"location": null,
//"share": {
//"url": "http://m.qdaily.com/mobile/special_columns/63.html",
//"title": "100 个生活大问题_好奇心日报",
//"text": "我们关注那些当代人类细枝末节又无比重要的生活动态，就是“哎你们最近发现没有”类话题。",
//"image": "http://img.qdaily.com/special_column/column/20180723152006VsRjKwHkMXZg5QDG.jpg?imageMogr2/auto-orient/thumbnail/!320x320r/gravity/Center/crop/320x320/quality/85/format/jpg/ignore-error/1"
//}
//}
//}
//}
