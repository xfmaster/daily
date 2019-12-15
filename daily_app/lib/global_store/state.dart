import 'package:daily_app/base/app_theme.dart';
import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState {
  AppTheme get appTheme;

  set appTheme(AppTheme appTheme);

}

class GlobalState extends GlobalBaseState implements Cloneable<GlobalState> {
  @override
  GlobalState clone() {
    print("GlobalState clone");
    return GlobalState()
      ..appTheme = appTheme;
  }

  @override
  AppTheme appTheme;
}
