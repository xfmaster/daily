import 'package:daily_app/home/labs/topic/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'view.dart';

class TopicComponent extends Component<TopicItemState> {
  TopicComponent()
      : super(
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<TopicItemState>(
                adapter: null,
                slots: <String, Dependent<TopicItemState>>{
                }),);

}
