import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class MainState implements GlobalBaseState, Cloneable<MainState> {
  @override
  MainState clone() {
    return MainState()..appTheme = appTheme;
  }

  @override
  AppTheme appTheme;
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}
