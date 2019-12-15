import 'dart:convert';
import 'dart:io';

import 'package:daily_app/common/Constant.dart';
import 'package:daily_app/utils/user_util.dart';
import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';

Dio dio = new Dio(); // 使用默认配置

void initDioOptions() {
// 配置dio实例
  dio.options.baseUrl = BASE_URL;
  dio.options.connectTimeout = 10000; //5s
  dio.options.receiveTimeout = 10000;
}

Future request(
  String requestMethod,
  String path,
  Map<String, dynamic> params,
) async {
  if (params == null) params = new Map();
  println(params);
  println(path);
  var user = UserUtil.getInstance().getUser();
  if (user != null) {
    if (params == null) params = new Map();
    println(user.user_id);
    dio.options.cookies = new List();
    dio.options.cookies
        .add(new Cookie('_qdaily3_app_session', user.refresh_token));
  }
  switch (requestMethod) {
    case 'post':
      var result;
      try {
        result = await dio.post(path, queryParameters: params);
      } catch (e) {
        return {"error": 400};
      }
      if (result == null) return {"error": 400};
      if (result.data['meta']['status'] == 200) {
        return result.data['response'];
      } else {
        return result.data;
      }
      break;
    case 'get':
      var result;
      try {
        result = await dio.get(path, queryParameters: params);
      } catch (e) {
        return {"error": 400};
      }
      if (result == null) return {"error": 400};
      if (result.data['meta']['status'] == 200) {
        return result.data['response'];
      } else {
        return result.data;
      }
//      return await dio.get(path, queryParameters: params).then((result) async {
//        print(result.data);
//        if (result.data['meta']['status'] == 200) {
//          return result.data['response'];
//        } else {
//          return result.data;
//        }
//      });
      break;
  }
}

Future requestGet(String path, {Map<String, dynamic> params}) async {
  return request("get", path, params);
}

Future requestPost(String path, {Map<String, dynamic> params}) async {
  return request("post", path, params);
}
