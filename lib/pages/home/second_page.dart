import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_init_app/common_widgets/azgo_appbar.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/page_routers/home_router.dart';
import 'package:provider/provider.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:qr_flutter/qr_flutter.dart';

class Second extends StatefulWidget {
  Second({Key key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  void beginScan() async {
    try {
      ScanResult cameraScanResult = await BarcodeScanner.scan(
          options: ScanOptions(useCamera: -1, // 1:前置摄像头 -1 后置摄像头
              strings: {
            "cancel": "取消",
            "flash_on": "开灯",
            "flash_off": "关灯",
          }));
      print("扫描结果:" +
          cameraScanResult.type.value.toString() +
          cameraScanResult.rawContent);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // 未授予APP相机权限
        print('未授予APP相机权限');
      } else {
        // 扫码错误
        print('扫码错误: $e');
      }
    } on FormatException {
      // 进入扫码页面后未扫码就返回
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      //扫码错误
      print('扫码错误: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AZGOAppBar(
          title: "Second页面",
          rightButtons: [
            GestureDetector(
              onTap: () {
                this.beginScan();
              },
              child: Icon(Icons.camera_alt),
            )
          ],
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
                  child: QrImage(
                    size: 300,
                    data: "7758521",
                    version: QrVersions.auto,
                    // embeddedImage: AssetImage("lib/images/icon.jpeg"),
                    // embeddedImageStyle:
                    //     QrEmbeddedImageStyle(size: Size(20, 20)),
                  )),
            ),
          );
        }));
  }
}
