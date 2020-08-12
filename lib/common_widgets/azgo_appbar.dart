import 'package:flutter/material.dart';

class AZGOAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerAlign;
  final String title;
  final PreferredSizeWidget bottom;
  final List<Widget> rightButtons;

  AZGOAppBar(
      {Key key,
      this.centerAlign = true,
      this.title,
      this.rightButtons,
      this.bottom})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerAlign,
      title: Text(title),
      actions: [
        rightButtons != null && rightButtons.length > 0
            ? Padding(
                padding: EdgeInsets.only(top: 5),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: rightButtons,
                  spacing: 5,
                ))
            : SizedBox(),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}
