import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_init_app/common_widgets/toast_util.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/models/user.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/page_routers/login_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key key, this.subTitle}) : super(key: key);

  final String subTitle;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    User user = User.fromJson(jsonDecode(widget.subTitle));
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                LoginRouter.backToLogin(context);
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(AppIntl.of(context).is_screen_name("注册")),
                    Text("姓名: ${user.nickName}"),
                    Text("年龄: ${user.age}"),
                  ]),
            )));
  }
}
