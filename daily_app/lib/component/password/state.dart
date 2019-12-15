import 'package:daily_app/component/base_component_state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

import '../component_key.dart';

class PasswordState
    with BaseComponentState
    implements Cloneable<PasswordState> {
  ///是否已经有文字
  bool enable;

  String hintText;

  ///密码是否课件
  bool visiblePassword;
  TextEditingController textEditingController;

  @override
  PasswordState clone() {
    return PasswordState()
      ..isInit = isInit
      ..enable = enable
      ..textEditingController = textEditingController
      ..visiblePassword = visiblePassword
      ..hintText = hintText;
  }
}

PasswordState initPasswordState(MapLike args) {
  println('initPasswordState');
  PasswordState passwordState = args[ComponentKey.passWordField];
  passwordState.enable ??= false;
  passwordState.isInit = true;
  passwordState.visiblePassword ??= false;
  passwordState.hintText ??= '密码';
  return passwordState;
}
