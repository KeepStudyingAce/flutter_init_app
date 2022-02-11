// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class AppIntl {
  AppIntl();
  
  static AppIntl current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<AppIntl> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      AppIntl.current = AppIntl();
      
      return AppIntl.current;
    });
  } 

  static AppIntl of(BuildContext context) {
    return Localizations.of<AppIntl>(context, AppIntl);
  }

  /// `Home`
  String get tab_home {
    return Intl.message(
      'Home',
      name: 'tab_home',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get tab_mine {
    return Intl.message(
      'Mine',
      name: 'tab_mine',
      desc: '',
      args: [],
    );
  }

  /// `Chage Lang`
  String get change_language {
    return Intl.message(
      'Chage Lang',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `This is {screen_name} screen!`
  String is_screen_name(Object screen_name) {
    return Intl.message(
      'This is $screen_name screen!',
      name: 'is_screen_name',
      desc: '',
      args: [screen_name],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppIntl> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppIntl> load(Locale locale) => AppIntl.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}