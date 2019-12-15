import 'package:daily_app/detail/colomn_center/all/item/component.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'reducer.dart';
import 'state.dart';

class AllColumnAdapter extends DynamicFlowAdapter<AllColumnState> {
  AllColumnAdapter()
      : super(
          pool: <String, Component<Object>>{'item': ItemComponent()},
          connector: _AllColumnConnector(),
          reducer: buildReducer(),
        );
}

class _AllColumnConnector extends ConnOp<AllColumnState, List<ItemBean>> {
  @override
  List<ItemBean> get(AllColumnState state) {
    if (state.list?.isNotEmpty == true) {
      return state.list.map<ItemBean>((AllColumnItemState data) {
        return ItemBean('item', data);
      }).toList();
    }
    return <ItemBean>[];
  }

  @override
  void set(AllColumnState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.list = List<AllColumnItemState>.from(
          items.map<AllColumnItemState>((ItemBean bean) {
        AllColumnItemState data = bean.data;
        return data;
      }).toList());
    } else {
      state.list = <AllColumnItemState>[];
    }
  }

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
