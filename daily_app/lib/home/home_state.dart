import 'package:daily_app/global_store/state.dart';
import 'package:daily_app/home/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

class HomeSingleTickerProviderState<T extends Cloneable<T>>
    extends ComponentState<T> with TickerProviderStateMixin {}
