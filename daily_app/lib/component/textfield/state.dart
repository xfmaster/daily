import 'package:daily_app/component/component_key.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

import '../base_component_state.dart';

class TextFieldState
    with BaseComponentState
    implements Cloneable<TextFieldState> {
  TextEditingController textEditingController;
  String text;
  String hintText;
  bool enable;

  ///是否有验证码输入按钮
  bool hasVerification;

  @override
  TextFieldState clone() {
    return TextFieldState()
      ..text = text
      ..textEditingController = textEditingController
      ..hintText = hintText
      ..hasVerification = hasVerification
      ..enable = enable
      ..isInit = isInit;
  }
}

TextFieldState initTextFieldState(MapLike args) {
  println('initTextFieldState');
  TextFieldState textFieldState = args[ComponentKey.textField];
  textFieldState ??= new TextFieldState();
  textFieldState.enable ??= false;
  textFieldState.text ??= '';
  textFieldState.isInit = true;
  textFieldState.hasVerification ??= false;
  textFieldState.hintText ??= '手机号码/邮箱';
  return textFieldState;
}

TextFieldState initCodeTextFieldState(MapLike args) {
  println('initTextFieldState');
  TextFieldState textFieldState = args[ComponentKey.code];
  textFieldState ??= new TextFieldState();
  textFieldState.enable ??= false;
  textFieldState.text ??= '';
  textFieldState.isInit = true;
  textFieldState.hasVerification ??= false;
  textFieldState.hintText ??= '手机号码/邮箱';
  return textFieldState;
}
