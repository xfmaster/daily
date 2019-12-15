import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/toolbar/component.dart';
import 'package:daily_app/component/toolbar/state.dart';
import 'package:daily_app/home/home_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WebPage extends Page<WebState, Map<String, dynamic>> {
  WebPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<WebState>(
              adapter: null,
              slots: <String, Dependent<WebState>>{
                'toolBar': ToolBarStateConnOp<WebState, ToolBarState>(
                        init: initToolBarState, key: ComponentKey.toolBar) +
                    ToolBarComponent(),
              }),
          middleware: <Middleware<WebState>>[],
        );

  @override
  ComponentState<WebState> createState() {
    // TODO: implement createState
    return HomeSingleTickerProviderState<WebState>();
  }
}
