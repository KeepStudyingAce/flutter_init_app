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
  Locale get locale => _locale != null ? _locale : Locale("zh");
  void changeAppLanguage(BuildContext context, Locale locale) {
    if (Intl.getCurrentLocale().contains("en")) {
      // 目前不区分各种英文
      S.load(Locale("zh"));
      eventBus.fire(ChangeLanguageEvent(Locale("zh")));
      ToastUtil.showToast(context, "修改语言中文成功");
    } else {
      S.load(Locale("en"));
      eventBus.fire(ChangeLanguageEvent(Locale("zh")));
      ToastUtil.showToast(context, "修改语言英文成功");
    }
  }
}
