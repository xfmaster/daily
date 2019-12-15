import 'package:fish_redux/fish_redux.dart';

import 'author_state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class AuthorHeadComponent extends Component<AuthorItemState> {
  AuthorHeadComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AuthorItemState>(
                adapter: null,
                slots: <String, Dependent<AuthorItemState>>{
                }),);

}
