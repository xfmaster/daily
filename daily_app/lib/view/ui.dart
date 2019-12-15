import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

Widget buildImage(String url, {double width, double height, BoxFit fit}) {
  return CachedNetworkImage(
    width: width,
    height: height,
    imageUrl: url,
    fit: fit==null?BoxFit.fill:fit,
    errorWidget: (BuildContext context, String url, Object error) {
      return Image.asset(
        'assets/icon_place_hor.png',
        height: height,
        width: width,
      );
    },
    placeholder: (BuildContext context, String url) {
      return Image.asset(
        'assets/icon_place_hor.png',
        height: height,
        width: width,
      );
    },
  );
}
