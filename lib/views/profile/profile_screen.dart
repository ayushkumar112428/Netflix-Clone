import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/profile_card.dart';

class ProfileScreen extends StatefulWidget {
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
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: userData[index]['color'],
                          borderRadius: BorderRadius.circular(6),
                          image: const DecorationImage(
                            image: AssetImage("assets/profile.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(userData[index]['name']),
                    ],
                  );
                },
              ),
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
                  onPressed: () {},
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
              onTap: () {},
            ),
            ProfileCard(
              icon: Icons.library_add_outlined,
              name: "My List",
              onTap: () {},
            ),
            ProfileCard(
              icon: Icons.settings,
              name: "App Setting",
              onTap: () {},
            ),
            ProfileCard(
              icon: Icons.person,
              name: "Account",
              onTap: () {},
            ),
            ProfileCard(
              icon: Icons.help_outline,
              name: "Help",
              onTap: () {},
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Correcting the route name to match '/SignIn' instead of '/SingIn'
                Navigator.pushReplacementNamed(context, "/SignIn");
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
