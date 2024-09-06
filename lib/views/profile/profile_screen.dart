import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  // final BuildContext ctx;
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, dynamic>> userData = [
    {
      "name": "Ayush",
      "color": AppColors.blueText,
    },
    {
      "name": "AAA",
      "color": AppColors.deepPurpleText,
    },
    {
      "name": "New",
      "color": AppColors.redColor,
    },
    {
      "name": "AAA",
      "color": AppColors.deepPurpleText,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.blueText,
                    borderRadius: BorderRadius.circular(6),
                    image: const DecorationImage(
                      image: AssetImage("assets/profileImage.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10,),
                    const Text("Ayush",style: AppTextStyles.titleStyle,),
                    IconButton(onPressed: (){
                      Navigator.pushNamed(context, "/MyNetflix");
                    }, icon: const Icon(Icons.keyboard_arrow_down_rounded,size: 30,)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Manage Profile",
                  style: AppTextStyles.titleStyle,
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    // Handle the edit button tap
                    print("Edit Profile tapped");
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ProfileCard(
              icon: Icons.notifications_active,
              name: "Notification",
              onTap: () {
                // Handle the Notification tap
                Navigator.pushNamed(context, "/Notification");
              },
            ),
            ProfileCard(
              icon: Icons.library_add_outlined,
              name: "My List",
              onTap: () {
                // Handle the My List tap
                Navigator.pushNamed(context, "/MyList");
              },
            ),
            ProfileCard(
              icon: Icons.settings,
              name: "App Setting",
              onTap: () {
                // Handle the App Setting tap
                print("App Setting tapped");
              },
            ),
            ProfileCard(
              icon: Icons.person,
              name: "Account",
              onTap: () {
                // Handle the Account tap
                print("Account tapped");
              },
            ),
            ProfileCard(
              icon: Icons.help_outline,
              name: "Help",
              onTap: () {
                // Handle the Help tap
                print("Help tapped");
              },
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Navigator.pushNamed("/SingIn");
                Navigator.pushReplacementNamed(context, "/SingIn");
              },
              child: Text(
                "Sign Out",
                style: AppTextStyles.subTextStyle.copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
