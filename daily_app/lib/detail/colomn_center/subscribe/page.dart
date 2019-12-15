import 'package:daily_app/component/button/component.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SubscribePage extends Page<SubscribeState, Map<String, dynamic>>
    with KeepAliveMixin {
  SubscribePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SubscribeState>(
              adapter: null,
              slots: <String, Dependent<SubscribeState>>{
                'btn': ButtonStateConnOp<SubscribeState, ButtonState>(
                        init: initButtonState) +
                    ButtonComponent()
              }),
          middleware: <Middleware<SubscribeState>>[],
        );
}
