import 'package:daily_app/home/index/banner/component.dart';
import 'package:daily_app/home/index/column/component.dart';
import 'package:daily_app/home/index/item/component.dart';
import 'package:daily_app/home/index/normal/component.dart';
import 'package:daily_app/home/index/study/component.dart';
import 'package:daily_app/home/labs/topic/component.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class NewsAdapter extends SourceFlowAdapter<IndexState> {
  NewsAdapter()
      : super(pool: <String, Component<Object>>{
          'normal': NormalComponent(),
          'item': ItemComponent(),
          'study': StudyComponent(),
          'banner': BannerComponent(),
          'column': ColumnComponent(),
          'topics': TopicComponent(),
        });
}

//class _NewsConnector extends ConnOp<IndexState, List<ItemBean>> {
//  @override
//  void set(IndexState state, List<ItemBean> items) {
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
//  List<ItemBean> get(IndexState state) {
//    if (state.list?.isNotEmpty == true) {
//      return state.list.map<ItemBean>((ItemState data) {
//        if (data.bean != null && data.bean.type == 2) {
//          return ItemBean('normal', data);
//        } else if (data.bean != null && data.bean.type == 1) {
//          return ItemBean('item', data);
//        } else if (data.bean == null &&
//            data.banners == null &&
//            data.columnData != null) {
//          return ItemBean('column', data);
//        } else if (data.bean == null &&
//            data.banners == null &&
//            data.columnData == null &&
//            data.topics != null) {
//          return ItemBean('topics', data);
//        } else if (data.banners != null) {
//          return ItemBean('banner', data);
//        } else {
//          return ItemBean('study', data);
//        }
//      }).toList(growable: true);
//    } else {
//      return <ItemBean>[];
//    }
//  }
//}
