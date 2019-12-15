import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LabsPage extends Page<LabsState, Map<String, dynamic>>  with KeepAliveMixin{
  LabsPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<LabsState>(
              adapter: NoneConn<LabsState>() + LabsAdapter(),
              slots: <String, Dependent<LabsState>>{}),
          middleware: <Middleware<LabsState>>[],
        );
}
