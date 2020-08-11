import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_init_app/common_widgets/toast_util.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/models/user.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/page_routers/login_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({Key key, this.subTitle}) : super(key: key);

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    User user = User.fromJson(jsonDecode(subTitle));
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  // if (Intl.getCurrentLocale().contains("en")) {
                  //   // 目前不区分各种英文
                  //   S.load(Locale("zh"));
                  //   ToastUtil.showToast(context, "修改语言中文成功");
                  // } else {
                  //   S.load(Locale("en"));
                  //   ToastUtil.showToast(context, "修改语言英文成功");
                  // }
                  Provider.of<AppProvider>(context, listen: false)
                      .changeAppLanguage(context, Locale("zh"));
                },
                child: Center(
                  child: Text(S.of(context).change_language),
                )),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: Container(
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                LoginRouter.backToLogin(context);
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(S.of(context).is_screen_name("注册")),
                    Text("姓名: ${user.nickName}"),
                    Text("年龄: ${user.age}"),
                  ]),
            )));
  }
}
