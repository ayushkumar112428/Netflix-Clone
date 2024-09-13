import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';

class AppThemeScreen extends StatefulWidget {
  const AppThemeScreen({super.key});

  @override
  State<AppThemeScreen> createState() => _AppThemeScreenState();
}

class _AppThemeScreenState extends State<AppThemeScreen> {
  bool isDarkMode = true;

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
      // Apply the theme change here, like calling a method to update the theme in your app.
    });
  }

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
        title: const Text('App Theme'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Your Theme',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              value: isDarkMode,
              onChanged: _toggleTheme,
              activeTrackColor: AppColors.green,
              inactiveTrackColor: AppColors.grayBox,
              activeColor: AppColors.white,
              inactiveThumbColor: AppColors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}
