import 'package:flutter/material.dart';
import 'dart:math';

class CommonColors {
  static const Color transparent = Color(0x00000000);
  static Gradient gradient = LinearGradient(
    colors: [Color(0xFFEFDCA4), Color(0xFFDBB76B)],
  );
  // 随机颜色
  static getRandomColor() {
    Random t = Random();
    int r = t.nextInt(255);
    int g = t.nextInt(255);
    int b = t.nextInt(255);
    return Color.fromARGB(255, r, g, b);
  }
}

class CommonFont {
  static const appBarTitleSize = 30.0;
}
