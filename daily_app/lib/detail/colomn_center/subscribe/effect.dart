import 'package:daily_app/common/common_action.dart';
import 'package:daily_app/component/button/action.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:daily_app/utils/user_util.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SubscribeState> buildEffect() {
  return combineEffects(<Object, Effect<SubscribeState>>{
    ButtonAction.onClickAction: _onClickAction,
    Lifecycle.initState: _loginSuccessAction,
    CommonAction.loginSuccessAction: _loginSuccessAction,
  });
}

void _onClickAction(Action action, Context<SubscribeState> ctx) {
  appPush('register', ctx.context);
}

void _loginSuccessAction(Action action, Context<SubscribeState> ctx) {
  var user = UserUtil.getInstance().getUser();
  if (user != null)
    requestGet(API_MY_SUBSCRIPTION,params:{'user_id':user.user_id}).then((res) {
      println(res);
    });
}
