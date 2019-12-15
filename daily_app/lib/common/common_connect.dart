import 'package:daily_app/component/base_component_state.dart';
import 'package:fish_redux/fish_redux.dart';

///组件链接器，每个组件的state必选实现[BaseComponentState]，否则会报错
class CommonConnOp<T extends MapLike, P> extends ConnOp<T, P> {
  final String key;
  final P Function(T state) init;

  CommonConnOp({this.init, String key}) : key = key ?? ('');

  @override
  P get(T state) {
    return (state[key] != null &&
            (state[key] as BaseComponentState).isInit == true)
        ? state[key]
        : (state[key] = init(state));
  }

  @override
  void set(T state, P subState) {
    state[key] = subState;
  }
}
