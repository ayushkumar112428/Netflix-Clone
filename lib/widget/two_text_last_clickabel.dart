import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class TwoTextLastClickabel extends StatelessWidget {
  final String text1;
  final Color text1Color;
  final String text2;
  final Color text2Color;
  final VoidCallback onTap;
  const TwoTextLastClickabel({super.key, required this.text1, required this.text1Color, required this.text2, required this.text2Color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: [
            TextSpan(
                text: text1,
                style: AppTextStyles.authScreenDetailsText.copyWith(color: text1Color)
            ),
            TextSpan(
              text: text2,
              style: AppTextStyles.authScreenDetailsText.copyWith(color: text2Color),
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
            ),
          ]
      ),
    );
  }
}
