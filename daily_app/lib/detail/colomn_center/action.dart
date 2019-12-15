import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ColumnCenterAction { action }

class ColumnCenterActionCreator {
  static Action onAction() {
    return const Action(ColumnCenterAction.action);
  }
}
