import 'package:flutter/material.dart';

class Config {
  static const PAGE_SIZE = 10;
  static const double kTextTabBarHeight = 48.0;
  static const USER_NAME_PWD_KEY = "USER_NAME_PWD_KEY";
  static const USER_COIN_SELECTION_KEY = "USER_COIN_SELECTION_KEY";
  static const USER_GROUP_KEY = "USER_GROUP_KEY";
  static const USER_FOLLOWING_KEY = "USER_FOLLOWING_KEY";

  static screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // iphoneX下巴高度
  static iphoneXBottomHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  // iphoneX刘海高度
  static iphoneXTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
