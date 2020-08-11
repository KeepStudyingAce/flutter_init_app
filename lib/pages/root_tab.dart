import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/pages/home/first_page.dart';
import 'package:flutter_init_app/pages/login/login_page.dart';

class RootTab extends StatefulWidget {
  RootTab({Key key}) : super(key: key);

  @override
  _RootTabState createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(
                title: Text(S.of(context).tab_home), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text(S.of(context).tab_login), icon: Icon(Icons.info)),
          ]),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return FirstPage();
              case 1:
                return Login();
              default:
            }
            return SizedBox();
          }),
    );
  }
}
