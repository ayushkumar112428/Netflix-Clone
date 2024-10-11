import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation
  const AppTextStyles._();

  static const TextStyle largeTitleStyle = TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: AppColors.white,fontFamily: "primary-font-family",);
  static const TextStyle titleStyle = TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColors.white,fontFamily: "primary-font-family",);
  static const TextStyle hedgingTextStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: AppColors.white,fontFamily: "primary-font-family",);
  static const TextStyle textButtonTextStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white,fontFamily: "primary-font-family",);
  static const TextStyle textStyle = TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.white,fontFamily: "primary-font-family",);
  static const TextStyle subTextStyle = TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.grayText,fontFamily: "primary-font-family",);
  static const TextStyle authScreenDetailsTextStyle = TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.white,fontFamily: "primary-font-family",);
  static const TextStyle onTapTextButtonTextStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.blue,fontFamily: "primary-font-family",decoration: TextDecoration.underline,decorationColor: AppColors.blue,);
}
