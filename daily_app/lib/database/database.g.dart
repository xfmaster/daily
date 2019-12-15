// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao _userDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`userName` TEXT, `id` INTEGER, `user_id` INTEGER, `alias` TEXT, `face` TEXT, `description` TEXT, `email` TEXT, `phone` TEXT, `address` TEXT, `weibo` INTEGER, `qq` INTEGER, `wechat` INTEGER, `access_token` TEXT, `refresh_token` TEXT, PRIMARY KEY (`user_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, dynamic>{
                  'userName': item.userName,
                  'id': item.id,
                  'user_id': item.user_id,
                  'alias': item.alias,
                  'face': item.face,
                  'description': item.description,
                  'email': item.email,
                  'phone': item.phone,
                  'address': item.address,
                  'weibo': item.weibo ? 1 : 0,
                  'qq': item.qq ? 1 : 0,
                  'wechat': item.wechat ? 1 : 0,
                  'access_token': item.access_token,
                  'refresh_token': item.refresh_token
                },
            changeListener),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['user_id'],
            (User item) => <String, dynamic>{
                  'userName': item.userName,
                  'id': item.id,
                  'user_id': item.user_id,
                  'alias': item.alias,
                  'face': item.face,
                  'description': item.description,
                  'email': item.email,
                  'phone': item.phone,
                  'address': item.address,
                  'weibo': item.weibo ? 1 : 0,
                  'qq': item.qq ? 1 : 0,
                  'wechat': item.wechat ? 1 : 0,
                  'access_token': item.access_token,
                  'refresh_token': item.refresh_token
                },
            changeListener),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['user_id'],
            (User item) => <String, dynamic>{
                  'userName': item.userName,
                  'id': item.id,
                  'user_id': item.user_id,
                  'alias': item.alias,
                  'face': item.face,
                  'description': item.description,
                  'email': item.email,
                  'phone': item.phone,
                  'address': item.address,
                  'weibo': item.weibo ? 1 : 0,
                  'qq': item.qq ? 1 : 0,
                  'wechat': item.wechat ? 1 : 0,
                  'access_token': item.access_token,
                  'refresh_token': item.refresh_token
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _userMapper = (Map<String, dynamic> row) => User(
      row['userName'] as String,
      row['id'] as int,
      row['user_id'] as int,
      row['alias'] as String,
      row['face'] as String,
      row['description'] as String,
      row['email'] as String,
      row['phone'] as String,
      row['address'] as String,
      (row['weibo'] as int) != 0,
      (row['qq'] as int) != 0,
      (row['wechat'] as int) != 0,
      row['access_token'] as String,
      row['refresh_token'] as String);

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<User> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?',
        arguments: <dynamic>[id], mapper: _userMapper);
  }

  @override
  Future<List<User>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM User', mapper: _userMapper);
  }

  @override
  Stream<List<User>> findAllUsersAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM User',
        tableName: 'User', mapper: _userMapper);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertUsers(List<User> user) async {
    await _userInsertionAdapter.insertList(
        user, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateUsers(List<User> user) async {
    await _userUpdateAdapter.updateList(user, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }

  @override
  Future<void> deleteUsers(List<User> user) async {
    await _userDeletionAdapter.deleteList(user);
  }
}
