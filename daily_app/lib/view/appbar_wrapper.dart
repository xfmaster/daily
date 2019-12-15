import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarWidget extends PreferredSize {
  final Widget child;
  final width;

  AppBarWidget(this.child, {this.width});

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(width, 48.0);
}

class AppBaBottomWidget extends PreferredSize {
  final Widget child;

  AppBaBottomWidget(this.child);

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(null, 96);
}
//
//class _AppBarWidgetState extends State<AppBarWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return widget.child;
//  }
//}

PreferredSize appBarWidgetWrapper(Widget child) => AppBarWidget(child);

PreferredSize appBarBottomWidgetWrapper(Widget child) =>
    AppBaBottomWidget(child);
