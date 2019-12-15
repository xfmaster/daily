import 'package:daily_app/common/common_connect.dart';
import 'package:daily_app/component/appbar/component.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/component/button/component.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/password/component.dart';
import 'package:daily_app/component/password/state.dart';
import 'package:daily_app/component/textfield/component.dart';
import 'package:daily_app/component/textfield/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LoginPage extends Page<LoginState, Map<String, dynamic>> {
  LoginPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<LoginState>(
              adapter: null,
              slots: <String, Dependent<LoginState>>{
                'appBar': CommonConnOp<LoginState, AppBarState>(
                        init: initAppBarState, key: ComponentKey.appBar) +
                    AppBarComponent(),
                'textField': CommonConnOp<LoginState, TextFieldState>(
                        init: initTextFieldState, key: ComponentKey.textField) +
                    TextFieldComponent(),
                'password': CommonConnOp<LoginState, PasswordState>(
                        init: initPasswordState,
                        key: ComponentKey.passWordField) +
                    PasswordComponent(),
                'btn': CommonConnOp<LoginState, ButtonState>(
                        init: initButtonState, key: ComponentKey.button) +
                    ButtonComponent(),
              }),
          middleware: <Middleware<LoginState>>[],
        );
}
