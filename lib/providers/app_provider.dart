import 'package:flutter/material.dart';
import 'package:flutter_init_app/common_utils/event_bus.dart';
import 'package:flutter_init_app/common_widgets/toast_util.dart';
import 'package:flutter_init_app/generated/l10n.dart';
import 'package:intl/intl.dart';

enum ThemeColorType {
  white,
  black,
}

class AppProvider with ChangeNotifier {
  ThemeColorType _themeColor = ThemeColorType.white;
  ThemeColorType get themeColor => _themeColor;

  void changeThemeColor(ThemeColorType newColor) {
    if (newColor != _themeColor) {
      print('🔥 主题色修改通知 👉 $newColor');
      _themeColor = newColor;
      notifyListeners();
    }
  }

  Locale _locale;
  Locale get locale =>
      _locale != null ? _locale : Locale(Intl.getCurrentLocale());
  void changeAppLanguage(BuildContext context, Locale locale) {
    String lang = locale.languageCode.split("_")[0];
    if (lang == "en") {
      // 目前不区分各种英文
      S.load(locale);
      _locale = locale;
      eventBus.fire(ChangeLanguageEvent(locale));
      ToastUtil.showToast(context, "修改语言为英文成功");
    } else {
      S.load(Locale("zh"));
      _locale = Locale("zh");
      eventBus.fire(ChangeLanguageEvent(Locale("zh")));
      ToastUtil.showToast(context, "修改语为中文成功");
    }
  }
}
