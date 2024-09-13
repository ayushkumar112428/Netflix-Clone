import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
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
        title: const Text('Help & Support'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Streaming Issues Section
          ListTile(
            leading: const Icon(Icons.live_tv, color: AppColors.white,),
            title: const Text('Streaming Issues'),
            subtitle: const Text('Troubleshoot video playback and streaming problems'),
            onTap: () {
              Navigator.pushNamed(context, '/StreamingIssues');
            },
          ),
          const Divider(),

          // Technical Support Section
          ListTile(
            leading: const Icon(Icons.support, color: AppColors.white,),
            title: const Text('Technical Support'),
            subtitle: const Text('Get assistance with technical issues'),
            onTap: () {
              Navigator.pushNamed(context, '/TechnicalSupport');
            },
          ),
          const Divider(),

          // Feedback and Suggestions Section
          ListTile(
            leading: const Icon(Icons.feedback, color: AppColors.white,),
            title: const Text('Feedback & Suggestions'),
            subtitle: const Text('Provide feedback and suggest improvements'),
            onTap: () {
              Navigator.pushNamed(context, '/FeedbackAndSuggestions');
            },
          ),
        ],
      ),
    );
  }
}
