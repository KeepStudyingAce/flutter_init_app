import 'package:flutter/material.dart';
import 'package:flutter_init_app/common_widgets/azgo_appbar.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/network/api.dart';
import 'package:flutter_init_app/routers/page_routers/home_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AZGOAppBar(
          title: "First 页面",
          rightButtons: [
            GestureDetector(
              onTap: () {
                Api.request({});
              },
              child: Icon(Icons.call),
            )
          ],
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
