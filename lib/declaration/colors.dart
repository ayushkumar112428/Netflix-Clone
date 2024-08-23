import 'package:flutter/material.dart';

class AppColors {

  static const Color white = Color(0xFFFFFFFF);
  static const Color redColor = Color(0xFFE40100);
  static const Color submitButtonColor = Color(0xFFE40100);
  static const Color errorColor = Color(0xFFFF0000);
  static const Color grayText = Color(0xFF8E8E8E);
  static const Color deepPurpleText = Color(0xFF543BED);

  Gradient homeImageTopToBottom = const LinearGradient(
    colors: [
      Color(0xFF000000),
      Color(0xFF000000),
      // Color(0xFF2C2C2C),
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
      // Color(0xFF2C2C2C),
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
