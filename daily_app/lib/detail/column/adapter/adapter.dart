import 'package:daily_app/detail/column/head/component.dart';
import 'package:daily_app/home/index/item/component.dart';
import 'package:daily_app/home/index/normal/component.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class ColumnAdapter extends SourceFlowAdapter<ColumnState> {
  ColumnAdapter()
      : super(pool: <String, Component<Object>>{
          'normal': NormalComponent(),
          'head': HeadComponent(),
          'item': ItemComponent(),
        });
}
