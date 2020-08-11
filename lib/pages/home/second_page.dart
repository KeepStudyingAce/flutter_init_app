import 'package:flutter/material.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/routers/page_routers/home_router.dart';

class Second extends StatefulWidget {
  Second({Key key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
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
  }
}
