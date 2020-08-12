import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_init_app/pages/root_tab.dart';
import 'package:flutter_init_app/pages/welcome_page.dart';
import 'package:flutter_init_app/routers/page_routers/mine_route.dart';
import 'page_routers/home_router.dart';
import 'page_routers/login_router.dart';
import 'iRouter_provider.dart';

class Routers {
  static String root = "/";
  static String homePage = "/home-page";
  static String webViewPage = "/web-view";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    // 闪屏页面
    router.define(root,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    WelcomePage()));
    // 主页面
    router.define(homePage,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    RootTab()));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(LoginRouter());
    _listRouter.add(HomeRouter());
    _listRouter.add(MineRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
