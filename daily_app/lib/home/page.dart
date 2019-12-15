import 'package:daily_app/home/state.dart' as prefix0;
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'home_state.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter: null, slots: <String, Dependent<HomeState>>{}),
          middleware: <Middleware<HomeState>>[],
        );

  @override
  ComponentState<HomeState> createState() {
    return HomeSingleTickerProviderState<prefix0.HomeState>();
  }
}
