import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_init_app/common_utils/event_bus.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:flutter_init_app/providers/app_provider.dart';
import 'package:flutter_init_app/routers/application.dart';
import 'package:flutter_init_app/routers/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:easy_alert/easy_alert.dart';

void main() {
  runApp(AlertProvider(
    child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
        child: MyApp()),
    config: AlertConfig(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) {
    final route = Router();
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
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        // 下面两个不配置，iOS端会报错
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
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
        print(_locale.languageCode + "===" + _locale.countryCode);
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
