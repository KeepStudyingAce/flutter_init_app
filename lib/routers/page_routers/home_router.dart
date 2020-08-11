import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_init_app/pages/home/first_page.dart';
import 'package:flutter_init_app/pages/home/second_page.dart';
import 'package:flutter_init_app/routers/iRouter_provider.dart';
import 'package:flutter_init_app/routers/navigation_utils.dart';

class HomeRouter implements IRouterProvider {
  /// 一级页面
  static String firstPage = "/first";

  /// 二级页面
  static String secondPage = "/second";

  static goSecond(BuildContext context) {
    NavigatorUtil.push(context, secondPage, transition: TransitionType.fadeIn);
  }

  static backToFirst(BuildContext context) {
    NavigatorUtil.goBack(context);
  }

  @override
  void initRouter(Router router) {
    /// 此处设置样式TransitionType无用
    router.define(
      firstPage,
      handler: Handler(handlerFunc: (_, params) => FirstPage()),
    );
    router.define(
      secondPage,
      handler: Handler(handlerFunc: (_, params) => Second()),
    );
  }
}
