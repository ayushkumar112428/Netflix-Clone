import 'package:flutter/material.dart';
import 'package:netflixclone/views/profile/account/manage_devices_screen.dart';
import 'package:netflixclone/views/profile/account/payment_history_screen.dart';
import 'package:netflixclone/views/profile/account/subscription_plan_screen.dart';
import 'package:netflixclone/views/profile/help/feedback_and_suggestion_screen.dart';
import 'package:netflixclone/views/profile/help/streaming_issues_screen.dart';
import 'package:netflixclone/views/profile/help/technical_support_screen.dart';
import 'package:netflixclone/views/profile/setting/app_theme_screen.dart';
import 'package:netflixclone/views/profile/setting/change_password.dart';
import 'package:netflixclone/views/auth/sing_in_screen.dart';
import 'package:netflixclone/views/auth/sing_up_screen.dart';
import 'package:netflixclone/views/bottom_bar.dart';
import 'package:netflixclone/views/download/download_screen.dart';
import 'package:netflixclone/views/home/home_screen.dart';
import 'package:netflixclone/views/profile/my_list.dart';
import 'package:netflixclone/views/profile/account_screen.dart';
import 'package:netflixclone/views/profile/app_setting.dart';
import 'package:netflixclone/views/profile/help_screen.dart';
import 'package:netflixclone/views/profile/my_netflix.dart';
import 'package:netflixclone/views/profile/notification_screen.dart';
import 'package:netflixclone/views/profile/profile_screen.dart';
import 'package:netflixclone/views/profile/setting/update_profile.dart';
import 'package:netflixclone/views/search/search_screen.dart';
import 'package:netflixclone/views/show_page/movie_screen.dart';
import 'package:netflixclone/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      // home: const SplashScreen(),
      initialRoute: "/BottomBar",
      routes: {
        '/SP': (context) => const SplashScreen(),
        '/SingIn': (context) => const SingInScreen(),
        '/SingUp': (context) => const SingUpScreen(),
        '/BottomBar': (context) => const BottomBar(),
        // BottomBar
        '/Home': (context) => const HomeScreen(),
        '/Search': (context) => const SearchScreen(),
        '/Download': (context) => const DownloadScreen(),
        '/Profile': (context) => const ProfileScreen(),
        // Home
        '/Movie': (context) => const MovieScreen(),
        // Profile
        '/MyNetflix': (context) => const MyNetflix(),
        '/Notification': (context) => const NotificationScreen(),
        '/MyList': (context) => const MyList(),
        '/AppSetting': (context) => const AppSettingsScreen(),
        '/Account': (context) => const AccountScreen(),
        '/HelpScreen': (context) => const HelpScreen(),
        // Profile - Setting
        '/ProfileUpdate': (context) => const ProfileUpdateScreen(),
        '/ChangePassword': (context) => const ChangePasswordScreen(),
        '/AppTheme': (context) => const AppThemeScreen(),
        //Profile - Account
        '/SubscriptionPlan': (context) => const SubscriptionPlanScreen(),
        '/PaymentHistory': (context) => const PaymentHistoryScreen(),
        '/ManageDevices': (context) => const ManageDevicesScreen(),
        '/Demo': (context) => const ProfileUpdateScreen(),
        //Profile - Help
        '/StreamingIssues': (context) => const StreamingIssuesScreen(),
        '/TechnicalSupport': (context) => const TechnicalSupportScreen(),
        '/FeedbackAndSuggestions': (context) => const FeedbackAndSuggestions(),
      },
    );
  }
}
