import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class ItemComponent extends Component<NewsItemState>
    {
  ItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<NewsItemState>(
              adapter: null, slots: <String, Dependent<NewsItemState>>{}),
        );

}
