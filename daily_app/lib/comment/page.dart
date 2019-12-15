import 'package:daily_app/common/common_connect.dart';
import 'package:daily_app/component/appbar/component.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentPage extends Page<CommentState, Map<String, dynamic>> {
  CommentPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommentState>(
                adapter: null,
                slots: <String, Dependent<CommentState>>{
                  "appBar": CommonConnOp<CommentState, AppBarState>(
                      init: initAppBarState) +
                      AppBarComponent()
                }),
            middleware: <Middleware<CommentState>>[
            ],);

}
