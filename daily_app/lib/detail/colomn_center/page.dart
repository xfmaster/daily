import 'package:daily_app/common/common_connect.dart';
import 'package:daily_app/component/appbar/bottom_component.dart';
import 'package:daily_app/component/appbar/component.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/home/home_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

///栏目中心
class ColumnCenterPage extends Page<ColumnCenterState, Map<String, dynamic>> {
  ColumnCenterPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ColumnCenterState>(
              adapter: null,
              slots: <String, Dependent<ColumnCenterState>>{
                "appBar": CommonConnOp<ColumnCenterState, AppBarState>(
                        init: initAppBarState) +
                    AppBarBottomComponent()
              }),
          middleware: <Middleware<ColumnCenterState>>[],
        );

  @override
  ComponentState<ColumnCenterState> createState() {
    return HomeSingleTickerProviderState<ColumnCenterState>();
  }
}
