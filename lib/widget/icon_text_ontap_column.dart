import 'package:flutter/material.dart';

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
          Image.asset(img),
          Text(title),
        ],
      ),
    );
  }
}
