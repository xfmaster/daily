import 'package:daily_app/component/toolbar/component.dart';
import 'package:daily_app/component/toolbar/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class QuestionPage extends Page<QuestionState, Map<String, dynamic>> {
  QuestionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<QuestionState>(
                adapter: null,
                slots: <String, Dependent<QuestionState>>{
                  'toolBar': ToolBarStateConnOp<QuestionState, ToolBarState>(
                      init: initToolBarState, key: 'toolBar') +
                      ToolBarComponent(),
                }),
            middleware: <Middleware<QuestionState>>[
            ],);

}
