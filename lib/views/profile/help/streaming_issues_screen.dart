import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/widget/card_widget.dart';

class StreamingIssuesScreen extends StatelessWidget {
  const StreamingIssuesScreen({super.key});

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
        title: const Text('Streaming Issues'),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.black,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Troubleshoot Video Playback & Streaming Problems',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  CardWidget(
                      icon: Icons.network_check,
                      title: 'Check Your Internet Connection',
                      description: 'Make sure you have a stable internet connection. Poor or unstable network can cause buffering issues.',
                      onTap: () {},
                  ),
                  CardWidget(
                    icon: Icons.restart_alt,
                    title: 'Restart Your Device',
                    description: 'Try restarting your device to resolve temporary issues that may interfere with streaming.',
                    onTap: () {},
                  ),
                  CardWidget(
                    icon: Icons.update,
                    title: 'Update the Netflix App',
                    description: 'Ensure that you are using the latest version of the Netflix app. Updates often include performance improvements.',
                    onTap: () {},
                  ),
                  CardWidget(
                    icon: Icons.delete_outline,
                    title: 'Clear Cache & Data',
                    description: 'Clearing the app’s cache and data can resolve playback issues related to corrupted files.',
                    onTap: () {},
                  ),
                  CardWidget(
                    icon: Icons.hd,
                    title: 'Check Video Quality Settings',
                    description: 'Lower the streaming quality in settings if you are experiencing buffering issues on a slower connection.',
                    onTap: () {},
                  ),
                  CardWidget(
                    icon: Icons.support_agent,
                    title: 'Contact Support',
                    description: 'If the issue persists, contact Netflix Support for further assistance.',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
