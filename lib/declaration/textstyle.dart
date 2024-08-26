import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation
  const AppTextStyles._();

  static const TextStyle largeTitleStyle = TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: AppColors.white);
  static const TextStyle titleStyle = TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: AppColors.white);
  static const TextStyle hedgingTextStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white);
  static const TextStyle textButtonTextStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.white);
  static const TextStyle textStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white);
  static const TextStyle subTextStyle = TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grayText);
  static const TextStyle authScreenDetailsTextStyle = TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.white);
}
