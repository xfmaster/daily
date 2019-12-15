import 'package:daily_app/detail/colomn_center/all/adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AllColumnPage extends Page<AllColumnState, Map<String, dynamic>>
    with KeepAliveMixin {
  AllColumnPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<AllColumnState>(
              adapter: NoneConn<AllColumnState>() + AllColumnAdapter(),
              slots: <String, Dependent<AllColumnState>>{}),
          middleware: <Middleware<AllColumnState>>[],
        );
}
