import 'package:daily_app/home/index/study/component.dart';
import 'package:daily_app/home/labs/state.dart';
import 'package:daily_app/home/labs/topic/component.dart';
import 'package:fish_redux/fish_redux.dart';

class LabsAdapter extends SourceFlowAdapter<LabsState> {
  LabsAdapter()
      : super(pool: <String, Component<Object>>{
          'study': StudyComponent(),
          'topics': TopicComponent(),
        });
}

//class _NewsConnector extends ConnOp<LabsState, List<ItemBean>> {
//  @override
//  void set(LabsState state, List<ItemBean> items) {
//    println("set");
//    if (items?.isNotEmpty == true) {
//      state.list = List<ItemState>.from(items.map<ItemState>((ItemBean bean) {
//        ItemState data = bean.data;
//        return data;
//      }).toList());
//    } else {
//      state.list = <ItemState>[];
//    }
//  }
//
//  @override
//  List<ItemBean> get(LabsState state) {
//    println("get");
//    if (state.list?.isNotEmpty == true) {
//      return state.list.map<ItemBean>((ItemState data) {
//        if (data.bean == null &&
//            data.banners == null &&
//            data.columnData == null &&
//            data.topics != null) {
//          return ItemBean('topics', data);
//        } else {
//          return ItemBean('study', data);
//        }
//      }).toList(growable: true);
//    } else {
//      return <ItemBean>[];
//    }
//  }
//
//  @override
//  subReducer(reducer) {
//    println("subReducer");
//    return super.subReducer(reducer);
//  }
//}
