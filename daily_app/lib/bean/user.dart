import 'package:floor/floor.dart';

///{id: 766874, user_id: 766874, _alias: 6cc590e5c519493e8618463ad474efde14744425,
/// username: 秋风扫落叶,
/// face: http://img.qdaily.com/face/face/20160604234635KD67mcSd8sq4FXH9.png?imageMogr2/auto-orient/thumbnail/!160x160r/gravity/Center/crop/160x160/quality/85/format/jpg/ignore-error/1,
/// description: , email: , phone: 15111342143, message_count: 0, address: null, weibo: false, qq: false,
/// wechat: false, twitter: false, xiaomi: false, huawei: false, comments_push_switch: true, praises_push_switch: true,
/// letter_push_switch: true, column_push_switch: true, support_column_init: true, username_modify_time: 0, face_modify_time: 0,
/// access_token: cc3feaea200e5038a973443a4a298f33ea839cb05412ab0dd2abe39e6df4eab9,
/// refresh_token: 69d0eb1fab5e0b38b16d56aac35583d1345c5208bd9027ec3d602859837b87b7,
/// expires_at: 1606848505}
@entity
class User {
  String userName;
  int id;
  @primaryKey
  int user_id;
  String alias;
  String face;
  String description;
  String email;
  String phone;
  String address;
  bool weibo;
  bool qq;
  bool wechat;
  String access_token;
  String refresh_token;

  User(
    this.userName,
    this.id,
    this.user_id,
    this.alias,
    this.face,
    this.description,
    this.email,
    this.phone,
    this.address,
    this.weibo,
    this.qq,
    this.wechat,
    this.access_token,
    this.refresh_token,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      json['username'],
      json['id'],
      json['user_id'],
      json['_alias'],
      json['face'],
      json['description'],
      json['email'],
      json['phone'],
      json['address'],
      json['weibo'],
      json['qq'],
      json['wechat'],
      json['access_token'],
      json['refresh_token'],
    );
  }
}
