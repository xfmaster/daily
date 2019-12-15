class Category {
  int id; //: 1,
  String title; //: 长文章,
  String
      normal; //: http://img.qdaily.com/category/icon_app/20160606144749JAgousWvnfD9r6Op.png?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/ignore-error/1,
  String
      white_icon; //: http://img.qdaily.com/category/icon_white_app/20161130162204XNnUWGkuvaS0O3ph.png?imageMogr2/auto-orient/thumbnail/!128x128r/gravity/Center/crop/128x128/quality/85/ignore-error/1,
  String black_icon;

  Category(
      {this.id,
      this.title,
      this.normal,
      this.white_icon,
      this.black_icon}); //: http://img.qdaily.com/category/icon_black_app/20161130162204tlE4TeI9WMkowxbO.png
  factory Category.fromJson(Map<String, dynamic> json) {
    return new Category(
        id: json['id'],
        title: json['title'],
        white_icon: json['white_icon'],
        black_icon: json['black_icon']);
  }
}
