import 'package:flutter/material.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/routers/page_routers/home_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("First页面"),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: GestureDetector(
                onTap: () {
                  HomeRouter.goSecond(context);
                },
                child: Text(S.of(context).is_screen_name("first"))),
          ),
        ));
  }
}
