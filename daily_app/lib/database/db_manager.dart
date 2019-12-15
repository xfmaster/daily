import 'package:daily_app/database/user_dao.dart';
import 'database.dart';

class DbManager {
  static DbManager _instance;
  AppDatabase database;

  static DbManager getInstance() {
    if (_instance == null) {
      _instance = DbManager._();
    }
    return _instance;
  }

  DbManager._() {
    init();
  }

  Future<dynamic>init() async {
    database = await $FloorAppDatabase.databaseBuilder('daily.db').build();
  }

  UserDao getUserDao() {
    return database.userDao;
  }
}
