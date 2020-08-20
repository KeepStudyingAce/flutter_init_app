import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_init_app/common_utils/event_bus.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/application.dart';
import 'package:flutter_init_app/routers/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:easy_alert/easy_alert.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(AlertProvider(
    child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
        child: FlutterEasyLoading(child: MyApp())),
    config: AlertConfig(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) {
    final route = Fluro.Router();
    Application.rootRouter = route;
    Routers.configureRoutes(route);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    ///不知道Intl load新的locale之后为什么不刷新
    eventBus.on<ChangeLanguageEvent>().listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // RefreshConfiguration(
        //     footerTriggerDistance: -15,
        //     dragSpeedRatio: 0.91,
        //     headerBuilder: () => MaterialClassicHeader(),
        //     footerBuilder: () => ClassicFooter(),
        //     enableLoadingWhenNoData: false,
        //     shouldFooterFollowWhenNotFull: (state) {
        //       // If you want load more with noMoreData state ,may be you should return false
        //       return false;
        //     },
        //     autoLoad: true,
        //     child:
        MaterialApp(
      localizationsDelegates: [
        S.delegate,
        // 下面两个不配置，iOS端会报错
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // RefreshLocalizations.delegate,
      ],
      // locale: widget.currentLocal,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Application.rootRouter.generator,
      //系统切换语言时候监听
      localeResolutionCallback:
          (Locale _locale, Iterable<Locale> supportedLocales) {
        // print(_locale.languageCode + "===" + _locale.countryCode);
        Locale locale;
        if (S.delegate.isSupported(_locale)) {
          locale = _locale;
        } else {
          // 默认中文
          locale = Locale("zh", 'CH');
        }
        S.load(locale);
        return locale;
      },
    );
  }
}
