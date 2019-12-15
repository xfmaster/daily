import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';

class AllColumnItemState implements Cloneable<AllColumnItemState> {
  Column column;

  @override
  AllColumnItemState clone() {
    return AllColumnItemState()..column = column;
  }
}

AllColumnItemState initAllColumnItemState(Column column) {
  return AllColumnItemState()..column = column;
}
