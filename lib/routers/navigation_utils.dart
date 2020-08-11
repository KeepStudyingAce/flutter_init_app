import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'application.dart';
import 'routers.dart';

/// fluro的路由跳转工具类
class NavigatorUtil {
  /// path中包含参数
  static push(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.native,
  }) {
    FocusScope.of(context).unfocus();
    Application.rootRouter.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
    );
  }

  /// 返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  ///带回调跳转
  static pushWithParam(
    BuildContext context,
    String path,
    Function(Object) function, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.native,
  }) {
    FocusScope.of(context).unfocus();
    Application.rootRouter
        .navigateTo(context, path,
            replace: replace, clearStack: clearStack, transition: transition)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  /// 带参数回调
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  /// 跳到WebView页
  static goWebViewPage(BuildContext context, String title, String url) {
    //fluro 不支持传中文,需转换
    push(context,
        '${Routers.webViewPage}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }
}
