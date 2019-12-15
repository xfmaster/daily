import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PasswordComponent extends Component<PasswordState> {
  PasswordComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PasswordState>(
                adapter: null,
                slots: <String, Dependent<PasswordState>>{
                }),);

}
