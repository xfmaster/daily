import 'package:daily_app/detail/column/head/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class HeadComponent extends Component<ColumnHeadState> {
  HeadComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ColumnHeadState>(
              adapter: null, slots: <String, Dependent<ColumnHeadState>>{}),
        );
}
