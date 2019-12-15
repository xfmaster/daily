import 'package:daily_app/common/common_connect.dart';
import 'package:daily_app/component/appbar/component.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/detail/column/state.dart' as prefix0;
import 'package:daily_app/view/appbar_wrapper.dart';
import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ColumnPage extends Page<ColumnState, Map<String, dynamic>> {
  ColumnPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ColumnState>(
              adapter: NoneConn<ColumnState>() + ColumnAdapter(),
              slots: <String, Dependent<ColumnState>>{
                'appbar': CommonConnOp<prefix0.ColumnState, AppBarState>(
                        init: initAppBarState) +
                    AppBarComponent()
              }),
          middleware: <Middleware<ColumnState>>[],
        );
}
