import 'package:daily_app/base/base_item.dart';
import 'package:fish_redux/fish_redux.dart';

abstract class BasePageState<T extends BaseItem> extends MutableSource {
  List<T> list;

  @override
  Object getItemData(int index) {
    return list[index];
  }

  @override
  String getItemType(int index) {
    return list[index].type;
  }

  @override
  int get itemCount => list == null ? 0 : list.length;

  @override
  void setItemData(int index, Object data) {
    list[index] = data;
  }
}
