import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_init_app/routers/navigation_utils.dart';
import 'package:flutter_init_app/routers/routers.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      // 跳转对应的主页
      NavigatorUtil.push(context, Routers.homePage,
          clearStack: true, transition: TransitionType.fadeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("WelcomePage"),
      ),
    );
  }
}
