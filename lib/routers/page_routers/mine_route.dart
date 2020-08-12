import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_init_app/pages/login/login_page.dart';
import 'package:flutter_init_app/pages/login/register_page.dart';
import 'package:flutter_init_app/routers/iRouter_provider.dart';
import 'package:flutter_init_app/routers/navigation_utils.dart';

class MineRouter implements IRouterProvider {
  /// 登陆root页
  static String loginPage = "/login";

  static goLogin(BuildContext context) {
    NavigatorUtil.push(context, loginPage,
        transition: TransitionType.inFromBottom);
  }

  @override
  void initRouter(Router router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, params) => Login()));
  }
}
