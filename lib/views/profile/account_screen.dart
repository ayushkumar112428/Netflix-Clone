import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
        title: const Text('Account Management'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Information Section
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.white,),
            title: const Text('Profile Information'),
            subtitle: const Text('Update your profile details'),
            onTap: () {
              Navigator.pushNamed(context, "/Demo");
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

          // Subscription Plan Section
          ListTile(
            leading: const Icon(Icons.subscriptions, color: AppColors.white,),
            title: const Text('Subscription Plan'),
            subtitle: const Text('View or change your subscription plan'),
            onTap: () {
              Navigator.pushNamed(context, "/SubscriptionPlan");
            },
          ),
          const Divider(),

          // Payment History Section
          ListTile(
            leading: const Icon(Icons.payment, color: AppColors.white,),
            title: const Text('Payment History'),
            subtitle: const Text('View your payment history'),
            onTap: () {
              Navigator.pushNamed(context, "/PaymentHistory");
            },
          ),
          const Divider(),

          // Manage Devices Section
          ListTile(
            leading: const Icon(Icons.devices, color: AppColors.white,),
            title: const Text('Manage Devices'),
            subtitle: const Text(
                'View and manage devices connected to your account'),
            onTap: () {
              Navigator.pushNamed(context, "/ManageDevices");
            },
          ),
          const Divider(),

          // Logout Section
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.white,),
            title: const Text('Logout'),
            subtitle: const Text('Sign out of your account'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
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
                      actionsPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
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
