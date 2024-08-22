import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SubmitButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.submitButtonColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(child: Text(title,style: AppTextStyles.title,)),
      ),
    );
  }
}
