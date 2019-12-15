import 'package:daily_app/detail/colomn_center/all/adapter/effect.dart';
import 'package:daily_app/detail/colomn_center/all/adapter/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'view.dart';

class ItemComponent extends Component<AllColumnItemState> {
  ItemComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
          dependencies: Dependencies<AllColumnItemState>(
              adapter: null, slots: <String, Dependent<AllColumnItemState>>{}),
        );
}
