import 'package:flutter/material.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/page_routers/home_router.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  Second({Key key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: Text("Second页面"),
        ),
        body: Consumer<AppProvider>(builder: (context, appProvider, _) {
          print(appProvider.locale);
          return Container(
            color: Colors.white,
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    HomeRouter.backToFirst(context);
                  },
                  child: Text(S.of(context).is_screen_name("Second"))),
            ),
          );
        }));
  }
}
