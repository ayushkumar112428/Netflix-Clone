import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class ManageDevicesScreen extends StatelessWidget {
  const ManageDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of connected devices for demonstration
    List<Map<String, String>> devices = [
      {'name': 'Samsung Smart TV', 'registrationDate': 'June 9, 2024'},
      {'name': 'iPhone 12', 'registrationDate': 'January 19, 2014'},
      {'name': 'Redmi Not 8', 'registrationDate': 'August 21, 2012'},
    ];

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
        title: const Text('Manage Devices'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage Devices Connected to Your Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  return _buildDeviceTile(devices[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceTile(Map<String, String> device) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                device['name']!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                "Registration date : ${device['registrationDate']}",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Sign out",
                style: AppTextStyles.onTapTextButtonTextStyle,
              ),
          ),
        ],
      ),
    );
  }
}
