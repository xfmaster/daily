import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/home/index/adapter/adapter.dart';
import 'package:daily_app/home/index/banner/component.dart';
import 'package:daily_app/home/index/state.dart' as prefix0;
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IndexPage extends Page<IndexState, Map<String, dynamic>>
    with KeepAliveMixin {
  IndexPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<IndexState>(
              adapter: NoneConn<IndexState>() + NewsAdapter(),
              slots: <String, Dependent<IndexState>>{}),
          middleware: <Middleware<IndexState>>[],
        );
}

