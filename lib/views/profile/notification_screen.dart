import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool allNotification = true;
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
          ),
        ),
        title: const Text(
          "Notications",
          style: AppTextStyles.hedgingTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Message Notification"),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notification",
                      style: AppTextStyles.hedgingTextStyle,
                    ),
                    const Text(
                      "Allocation of all types of notifications.",
                      style: AppTextStyles.subTextStyle,
                    ),
                  ],
                ),
                Switch(
                  value: allNotification,
                  onChanged: (value) {
                    setState(() {
                      allNotification = value;
                    });
                  },
                  activeTrackColor: AppColors.green,
                  inactiveTrackColor: AppColors.grayColor,
                  activeColor: AppColors.white,
                  inactiveThumbColor: AppColors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 5,
                  child: Text(
                    "Notification",
                    style: AppTextStyles.hedgingTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: allNotification,
                    onChanged: (value) {
                      setState(() {
                        allNotification = value;
                      });
                    },
                    activeTrackColor: AppColors.green,
                    inactiveTrackColor: AppColors.grayColor,
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                )
              ],
            ),
            const Text(
              "Allocation of all types of notifications.",
              style: AppTextStyles.subTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
