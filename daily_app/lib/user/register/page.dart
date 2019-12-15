import 'package:daily_app/common/common_connect.dart';
import 'package:daily_app/component/appbar/component.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/component/button/component.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/textfield/component.dart';
import 'package:daily_app/component/textfield/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RegisterPage extends Page<RegisterState, Map<String, dynamic>> {
  RegisterPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RegisterState>(
              adapter: null,
              slots: <String, Dependent<RegisterState>>{
                'appBar': CommonConnOp<RegisterState, AppBarState>(
                        init: initAppBarState, key: ComponentKey.appBar) +
                    AppBarComponent(),
                'textField': CommonConnOp<RegisterState, TextFieldState>(
                        init: initTextFieldState, key: ComponentKey.textField) +
                    TextFieldComponent(),
                'code': CommonConnOp<RegisterState, TextFieldState>(
                        init: initCodeTextFieldState, key: ComponentKey.code) +
                    TextFieldComponent(),
                'btn': CommonConnOp<RegisterState, ButtonState>(
                        init: initButtonState, key: ComponentKey.button) +
                    ButtonComponent(),
              }),
          middleware: <Middleware<RegisterState>>[],
        );
}
