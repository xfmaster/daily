import 'package:daily_app/home/index/item/component.dart';
import 'package:daily_app/home/index/normal/component.dart';
import 'package:daily_app/user/author/head/component.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class AuthorAdapter extends SourceFlowAdapter<AuthorHomeState> {
  AuthorAdapter()
      : super(pool: <String, Component<Object>>{
          'normal': NormalComponent(),
          'head': AuthorHeadComponent(),
          'item': ItemComponent(),
        });
}

//class _NewsConnector extends ConnOp<AuthorHomeState, List<ItemBean>> {
//  @override
//  void set(AuthorHomeState state, List<ItemBean> items) {
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
//  List<ItemBean> get(AuthorHomeState state) {
//    println("get");
//    if (state.list?.isNotEmpty == true) {
//      return state.list.map<ItemBean>((ItemState data) {
//        if (data.bean == null &&
//            data.columnData == null &&
//            data.banners == null) {
//          return new ItemBean('head', data);
//        } else if (data.bean != null && data.bean.type == 1) {
//          return ItemBean('item', data);
//        }
//        return ItemBean('normal', data);
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
