import 'package:daily_app/base/app_theme.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store {
    var appTheme = AppTheme.getInstance();
    return _globalStore ??= createStore<GlobalState>(
        GlobalState()..appTheme = appTheme, buildReducer());
  }
}
