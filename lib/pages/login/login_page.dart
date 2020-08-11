import 'package:flutter/material.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/models/user.dart';
import 'package:flutter_init_app/routers/page_routers/login_router.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: GestureDetector(
        onTap: () {
          User temp = User("Jack", 15);
          LoginRouter.goRegistWithCallback(context, temp);
        },
        child: Text(S.of(context).is_screen_name("Login")),
      )),
    );
  }
}
