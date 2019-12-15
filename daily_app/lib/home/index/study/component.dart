import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'view.dart';

class StudyComponent extends Component<NewsItemState> {
  StudyComponent()
      : super(
          view: buildView,
          effect:buildEffect(),
          dependencies: Dependencies<NewsItemState>(
              adapter: null, slots: <String, Dependent<NewsItemState>>{}),
        );
}
