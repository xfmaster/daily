import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ButtonComponent extends Component<ButtonState> {
  ButtonComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ButtonState>(
                adapter: null,
                slots: <String, Dependent<ButtonState>>{
                }),);

}
