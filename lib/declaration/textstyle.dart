import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation
  const AppTextStyles._();

  static const TextStyle largeTitle = TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: AppColors.white);
  static const TextStyle title = TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: AppColors.white);
  static const TextStyle hedgingText = TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white);
  static const TextStyle authScreenDetailsText = TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.white);
  static const TextStyle normalText = TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.white);
}
