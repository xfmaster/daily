import 'package:daily_app/bean/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User WHERE id = :id')
  Future<User> findUserById(int id);

  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User')
  Stream<List<User>> findAllUsersAsStream();

  @insert
  Future<void> insertUser(User user);

  @insert
  Future<void> insertUsers(List<User> user);

  @update
  Future<void> updateUser(User user);

  @update
  Future<void> updateUsers(List<User> user);

  @delete
  Future<void> deleteUser(User user);

  @delete
  Future<void> deleteUsers(List<User> user);
}
