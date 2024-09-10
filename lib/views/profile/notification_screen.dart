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
  bool newMovieRelease = true;
  bool upcomingMovieTrailer = true;
  bool specialOffers = true;
  bool updateAppNotification = true;
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
          "Notifications",
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
            const Text("Message Notification"),
            const SizedBox(
              height: 16,
            ),
            // Notification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Show Notification",
                        style: AppTextStyles.hedgingTextStyle,
                      ),
                      Text(
                        "Allocation of all types of notifications.",
                        style: AppTextStyles.subTextStyle,
                      ),
                    ],
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
                    inactiveTrackColor: AppColors.grayBox,
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6,bottom: 12),
              child: Divider(),
            ),
            // New Movie Release
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Movie Release",
                        style: AppTextStyles.hedgingTextStyle,
                      ),
                      Text(
                        "Stay tuned! A new blockbuster has just been added to our collection.",
                        style: AppTextStyles.subTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: newMovieRelease,
                    onChanged: (value) {
                      setState(() {
                        newMovieRelease = value;
                      });
                    },
                    activeTrackColor: AppColors.green,
                    inactiveTrackColor: AppColors.grayBox,
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6,bottom: 12),
              child: Divider(),
            ),
            // Upcoming Movie Trailer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Upcoming Movie Trailer",
                        style: AppTextStyles.hedgingTextStyle,
                      ),
                      Text(
                        "Get a glimpse of the upcoming blockbuster.",
                        style: AppTextStyles.subTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: upcomingMovieTrailer,
                    onChanged: (value) {
                      setState(() {
                        upcomingMovieTrailer = value;
                      });
                    },
                    activeTrackColor: AppColors.green,
                    inactiveTrackColor: AppColors.grayBox,
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6,bottom: 12),
              child: Divider(),
            ),
            // Special Offers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Special Offers",
                        style: AppTextStyles.hedgingTextStyle,
                      ),
                      Text(
                        "Don't miss out on exclusive discounts and promotions available now.",
                        style: AppTextStyles.subTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: specialOffers,
                    onChanged: (value) {
                      setState(() {
                        specialOffers = value;
                      });
                    },
                    activeTrackColor: AppColors.green,
                    inactiveTrackColor: AppColors.grayBox,
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6,bottom: 12),
              child: Divider(),
            ),
            // Update application
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Update application",
                        style: AppTextStyles.hedgingTextStyle,
                      ),
                      Text(
                        "You will receive notification about update application.",
                        style: AppTextStyles.subTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: updateAppNotification,
                    onChanged: (value) {
                      setState(() {
                        updateAppNotification = value;
                      });
                    },
                    activeTrackColor: AppColors.green,
                    inactiveTrackColor: AppColors.grayBox,
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
