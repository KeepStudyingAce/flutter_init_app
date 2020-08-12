import 'package:flutter/material.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/page_routers/mine_route.dart';
import 'package:provider/provider.dart';

class MinaPage extends StatelessWidget {
  const MinaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("我的页面"),
        actions: [
          Center(
              child: GestureDetector(
            onTap: () {
              MineRouter.goLogin(context);
            },
            child: Icon(Icons.settings),
          )),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeAppLanguage(context, Locale("zh"));
              },
              child: Center(
                child: Text(S.of(context).change_language),
              )),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SizedBox(),
    );
  }
}
