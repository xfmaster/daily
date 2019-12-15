import 'package:daily_app/user/author/state.dart' as prefix0;
import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AuthorHomePage extends Page<AuthorHomeState, Map<String, dynamic>> {
  AuthorHomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<AuthorHomeState>(
              adapter: NoneConn<AuthorHomeState>() + AuthorAdapter(),
              slots: <String, Dependent<AuthorHomeState>>{}),
          middleware: <Middleware<AuthorHomeState>>[],
        );
}
