import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.white,
          ),
        ),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          ListTile(
            leading: const Icon(Icons.person,color: AppColors.white,),
            title: const Text('Profile'),
            subtitle: const Text('View and update your profile information'),
            onTap: () {
              // Navigate to the profile page
              Navigator.pushNamed(context, "/ProfileUpdate");
            },
          ),
          const Divider(),

          // Change Password Section
          ListTile(
            leading: const Icon(Icons.lock,color: AppColors.white,),
            title: const Text('Change Password'),
            subtitle: const Text('Update your password'),
            onTap: () {
              // Navigate to the change password page
              Navigator.pushNamed(context, "/ChangePassword");
            },
          ),
          const Divider(),

          // App Theme Section
          ListTile(
            leading: const Icon(Icons.color_lens,color: AppColors.white,),
            title: const Text('App Theme'),
            subtitle: const Text('Choose light or dark mode'),
            onTap: () {
              // Navigate to the theme settings page
              Navigator.pushNamed(context, "/AppTheme");
            },
          ),
          const Divider(),

          // Language Section
          ListTile(
            leading: const Icon(Icons.language,color: AppColors.white,),
            title: const Text('Language'),
            subtitle: const Text('Select your preferred language'),
            onTap: () {
              // Navigate to the language settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageSettingsPage()),
              );
            },
          ),
          const Divider(),

          // Logout Section
          ListTile(
            leading: const Icon(Icons.exit_to_app,color: AppColors.white,),
            title: const Text('Logout'),
            subtitle: const Text('Sign out of your account'),
            onTap: () {
              // Handle logout
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: AppColors.graySearchBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  content: const Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  actionsPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: AppTextStyles.textStyle,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform logout action
                        Navigator.of(context).pop();
                        // Navigate to the login screen
                        Navigator.pushReplacementNamed(context, "/SingIn");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.submitButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: AppTextStyles.textStyle,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Placeholder for LanguageSettingsPage
class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.white,
          ),
        ),
        title: const Text('Language'),
      ),
      body: const Center(
        child: Text('Language selection functionality goes here.'),
      ),
    );
  }
}
