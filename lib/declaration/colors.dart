import 'package:flutter/material.dart';

class AppColors {

  static const Color white = Color(0xFFFFFFFF);
  static const Color redColor = Color(0xFFE40100);
  static const Color submitButtonColor = Color(0xFFE40100);
  static const Color errorColor = Color(0xFFFF0000);
  static const Color grayText = Color(0xFF8E8E8E);
  static const Color graySearchBarColor = Color(0xFF292929);
  static const Color grayColor = Color(0xFF737373);
  static const Color deepPurpleText = Color(0xFF543BED);
  static const Color blueText = Color(0xFF625ec6);
  static const Color boxBlackColor = Color(0xFF2c2c2c);

  Gradient homeImageTopToBottom = const LinearGradient(
    colors: [
      Color(0xFF000000),
      Color(0xFF000000),
      Colors.transparent,
    ],
    stops: [
      0.0,
      0.1,
      1.0,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  Gradient homeImageBottomToTop = const LinearGradient(
    colors: [
      Color(0xFF000000),
      Color(0xFF000000),
      Colors.transparent,
    ],
    stops: [
      0.0,
      0.1,
      1.0,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
