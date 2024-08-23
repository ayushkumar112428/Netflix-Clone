import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class IconTextOnTapColumn extends StatelessWidget {
  final String img;
  final String title;
  final VoidCallback onTap;
  const IconTextOnTapColumn({super.key, required this.img, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(img,width: 28,height: 28,fit: BoxFit.fill,),
          const SizedBox(height: 3,),
          Text(title,style: AppTextStyles.textButtonTextStyle,),
        ],
      ),
    );
  }
}
