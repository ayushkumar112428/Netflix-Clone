import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/card_widget.dart';

class TechnicalSupportScreen extends StatelessWidget {
  const TechnicalSupportScreen({super.key});

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
        title: const Text('Technical Support'),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.black,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Need Help with Technical Issues?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Resolve issues or contact support for assistance.',
              style: AppTextStyles.subTextStyle
                  .copyWith(color: AppColors.grayText),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  CardWidget(
                    icon: Icons.wifi_off_rounded,
                    title: 'Network Connection Issues',
                    description: 'Troubleshoot your internet issues.',
                    onTap: () {
                      _showTechnicalDetailsPopup(
                        context,
                        issueTitle: 'Network Connection Issues',
                        issueDetails:
                            '''If you're experiencing network connection issues, start by checking your router or modem to ensure it's powered on and functioning properly. Restart your WiFi or switch to mobile data to see if the problem persists. If the issue continues, contact your Internet Service Provider (ISP) to resolve any potential outages or service disruptions in your area.''',
                        steps: [
                          'Check your router/modem status.',
                          'Restart your WiFi or switch to mobile data.',
                          'Contact your ISP if the issue persists.',
                        ],
                      );
                    },
                  ),
                  CardWidget(
                    icon: Icons.play_circle_fill,
                    title: 'Playback Issues',
                    description: 'Fix video or audio playback problems.',
                    onTap: () {
                      _showTechnicalDetailsPopup(
                        context,
                        issueTitle: 'Playback Issues',
                        issueDetails:
                            '''For playback issues, first, verify your internet speed and connection to ensure it's sufficient for streaming. Update the Netflix app to the latest version to fix any bugs or compatibility issues. If problems persist, clear the app cache or restart your device to resolve potential glitches affecting playback.''',
                        steps: [
                          'Check your internet speed and connection.',
                          'Update the app to the latest version.',
                          'Clear the app cache and try again.',
                        ],
                      );
                    },
                  ),
                  CardWidget(
                    icon: Icons.bug_report,
                    title: 'App Performance Issues',
                    description: 'Resolve slow app performance or crashes.',
                    onTap: () {
                      _showTechnicalDetailsPopup(
                        context,
                        issueTitle: 'App Performance Issues',
                        issueDetails:
                            '''If you're facing app performance issues, try closing other apps running in the background to free up system resources. Restart your device to refresh its memory and improve performance. Ensure your device meets the app's requirements and that both your operating system and the Netflix app are up to date to avoid compatibility problems.''',
                        steps: [
                          'Close other apps running in the background.',
                          'Restart your device to free up memory.',
                          'Ensure your device meets app requirements',
                        ],
                      );
                    },
                  ),
                  CardWidget(
                    icon: Icons.phone_android_rounded,
                    title: 'Device Compatibility',
                    description: 'Check device compatibility for Netflix.',
                    onTap: () {
                      _showTechnicalDetailsPopup(
                        context,
                        issueTitle: 'Device Compatibility',
                        issueDetails:
                            '''To ensure device compatibility with Netflix, check that your device meets the minimum system requirements specified by Netflix. Update both your device's operating system and the Netflix app to the latest versions to support the latest features and fixes. Verify that your device supports the necessary DRM technology for streaming content without issues.''',
                        steps: [
                          'Verify the minimum device specifications.',
                          'Update your OS and Netflix app.',
                          'Ensure proper DRM support for Netflix streaming.',
                        ],
                      );
                    },
                  ),
                  CardWidget(
                    icon: Icons.phone,
                    title: 'Contact Support',
                    description: 'Call or message us for further help.',
                    onTap: () {
                      _showContactOptions(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTechnicalDetailsPopup(
    BuildContext context, {
    required String issueTitle,
    String? issueDetails,
    required List<String> steps,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      issueTitle,
                      style: AppTextStyles.hedgingTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      issueDetails ?? '',
                      style: AppTextStyles.subTextStyle,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Steps to Resolve:',
                      style: AppTextStyles.hedgingTextStyle,
                    ),
                    const SizedBox(height: 8),
                    ...steps.asMap().entries.map((entry) {
                      int index = entry.key;
                      String step = entry.value;
                      return _buildStepItem(index + 1, step);
                    }),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.grayCard,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        child: const Text('Got It'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStepItem(int index, String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        '$index.    $step',
        style: AppTextStyles.subTextStyle.copyWith(
          color: AppColors.grayText,
        ),
      ),
    );
  }

  void _showContactOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.phone, color: AppColors.green),
                title: const Text(
                  'Call Support',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle call support action
                },
              ),
              ListTile(
                leading: const Icon(Icons.email, color: AppColors.green),
                title: const Text(
                  'Email Support',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle email support action
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat, color: AppColors.green),
                title: const Text(
                  'Live Chat',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle live chat action
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
