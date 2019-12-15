import 'package:fish_redux/fish_redux.dart';

abstract class BaseItem<T> implements Cloneable<BaseItem> {
  String get type;

  set type(String type);

  T bean;
}
