import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onTap;
  const ProfileCard({super.key, required this.icon, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          shadowColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(icon,size: 24,),
                    const SizedBox(width: 10,),
                    Text(name,style: AppTextStyles.textStyle,),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios,size: 24,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
