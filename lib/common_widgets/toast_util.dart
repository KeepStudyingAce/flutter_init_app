import 'package:flutter/material.dart';
import 'package:easy_alert/easy_alert.dart';

class ToastUtil {
  static showToast(BuildContext context, String message) {
    Alert.toast(context, message,
        position: ToastPosition.center, duration: ToastDuration.short);
  }
}
