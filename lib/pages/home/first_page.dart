import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_init_app/common_widgets/azgo_appbar.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/network/api.dart';
import 'package:flutter_init_app/routers/page_routers/home_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

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
        body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: CustomHeader(
              builder: (BuildContext context, RefreshStatus mode) {
                Widget body;
                if (mode == RefreshStatus.idle) {
                  body = Text("pull down to refresh");
                } else if (mode == RefreshStatus.refreshing) {
                  body = CupertinoActivityIndicator();
                } else if (mode == RefreshStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == RefreshStatus.canRefresh) {
                  body = Text("release to load more");
                } else {
                  body = Text("Refresh success");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: Container(
              color: Colors.white,
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      HomeRouter.goSecond(context);
                    },
                    child: Text(S.of(context).is_screen_name("first"))),
              ),
            )));
  }
}
