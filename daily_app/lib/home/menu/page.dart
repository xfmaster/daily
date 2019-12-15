import 'package:fish_redux/fish_redux.dart';

import '../home_state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MenuPage extends Page<MenuState, Map<String, dynamic>> {
  MenuPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MenuState>(
              adapter: null,
              slots: <String, Dependent<MenuState>>{
              }),
          middleware: <Middleware<MenuState>>[],
        );

  @override
  ComponentState<MenuState> createState() {
    return HomeSingleTickerProviderState<MenuState>();
  }
}
