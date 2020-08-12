import 'package:flutter/material.dart';
import 'package:flutter_init_app/common_widgets/azgo_appbar.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/page_routers/mine_route.dart';
import 'package:provider/provider.dart';

class MinaPage extends StatelessWidget {
  const MinaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AZGOAppBar(
        title: "我的页面",
        rightButtons: [
          GestureDetector(
            onTap: () {
              MineRouter.goLogin(context);
            },
            child: Icon(Icons.settings),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Provider.of<AppProvider>(context, listen: false)
                  .changeAppLanguage(context, Locale("zh"));
            },
            child: Text(S.of(context).change_language),
          ),
        ],
      ),
      body: SizedBox(),
    );
  }
}
