import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/base/base_page_state.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LabsState extends BasePageState<BaseItem>
    implements GlobalBaseState, Cloneable<LabsState> {
  RefreshController refreshController;
  bool hasMore;
  int lastKey;
  int lastId;

  @override
  LabsState clone() {
//    if (list != null && appTheme != AppTheme.getInstance()) {
//      for (int i = 0; i < list.length; i++) {
//        list[i] = list[i].clone();
//      }
//      println("index-----clone");
//    }
    return LabsState()
      ..refreshController = refreshController
      ..appTheme = appTheme
      ..hasMore = hasMore
      ..lastKey = lastKey
      ..list = list
      ..lastId = lastId;
  }

  @override
  AppTheme appTheme;

//  @override
//  String getItemType(int index) {
//    var item = list[index];
//    if (item is TopicItemState) {
//      return 'topics';
//    }
//    return 'study';
//  }
}

LabsState initState(Map<String, dynamic> args) {
  return LabsState()..refreshController = new RefreshController();
}
