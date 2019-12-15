import 'package:daily_app/bean/user.dart';
import 'package:daily_app/database/db_manager.dart';

class UserUtil {
  static UserUtil _instance;
  User user;

  static UserUtil getInstance() {
    if (_instance == null) {
      _instance = UserUtil._();
    }
    return _instance;
  }

  UserUtil._() {}

  void init() {
    DbManager.getInstance().getUserDao().findAllUsers().then((list) {
      if (list == null || list.length == 0) return null;
      user = list[0];
    });
  }

  User getUser() {
    return user;
  }
}
