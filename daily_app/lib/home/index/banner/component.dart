import 'package:daily_app/home/index/banner/banner_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class BannerComponent extends Component<BannerItemState> {
  BannerComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BannerItemState>(
                adapter: null,
                slots: <String, Dependent<BannerItemState>>{
                }),);

}
