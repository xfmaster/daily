import 'package:flutter/material.dart';
import 'dart:math' as math;

const FloatingActionButtonLocation leftFloat =
    _LeftFloatFloatingActionButtonLocation();

class _LeftFloatFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  const _LeftFloatFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Compute the x-axis offset.
    final double fabX = 15;

    // Compute the y-axis offset.
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;
    double fabY = contentBottom - fabHeight - kFloatingActionButtonMargin;
    if (snackBarHeight > 0.0)
      fabY = math.min(
          fabY,
          contentBottom -
              snackBarHeight -
              fabHeight -
              kFloatingActionButtonMargin);
    if (bottomSheetHeight > 0.0)
      fabY =
          math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    return Offset(fabX, fabY-15);
  }

  @override
  String toString() => 'FloatingActionButtonLocation.centerFloat';
}
