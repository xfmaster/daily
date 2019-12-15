import 'package:daily_app/home/home_state.dart';
import 'package:daily_app/view/appbar_wrapper.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AppBarBottomComponent extends Component<AppBarState> {
  AppBarBottomComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          wrapper: appBarBottomWidgetWrapper,
          dependencies: Dependencies<AppBarState>(
              adapter: null, slots: <String, Dependent<AppBarState>>{}),
        );

  @override
  ComponentState<AppBarState> createState() {
    return HomeSingleTickerProviderState<AppBarState>();
  }
}
