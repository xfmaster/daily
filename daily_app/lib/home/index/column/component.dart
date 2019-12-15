import 'package:daily_app/home/index/column/column_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class ColumnComponent extends Component<ColumnItemState> {
  ColumnComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
          reducer: buildReducer(),
          dependencies: Dependencies<ColumnItemState>(
              adapter: null, slots: <String, Dependent<ColumnItemState>>{}),
        );
}
