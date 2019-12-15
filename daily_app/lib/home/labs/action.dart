import 'package:daily_app/bean/lab_bean.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LabsAction { refreshAction, loadAction, refreshData, loadData }

class LabsActionCreator {
  static Action refreshAction() {
    return const Action(LabsAction.refreshAction);
  }

  static Action loadAction() {
    return const Action(LabsAction.loadAction);
  }

  static Action refreshData(LabBean bean) {
    return Action(LabsAction.refreshData, payload: bean);
  }

  static Action loadData(LabBean bean) {
    return Action(LabsAction.loadData, payload: bean);
  }
}
