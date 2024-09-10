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
              // Navigate to Streaming Issues page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StreamingIssuesPage()),
              );
            },
          ),
          const Divider(),

          // Account Management Section
          ListTile(
            leading: const Icon(Icons.account_circle, color: AppColors.white,),
            title: const Text('Account Management'),
            subtitle: const Text('Manage your account settings and preferences'),
            onTap: () {
              // Navigate to Account Management page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountManagementPage()),
              );
            },
          ),
          const Divider(),

          // Subscription and Billing Section
          ListTile(
            leading: const Icon(Icons.payment, color: AppColors.white,),
            title: const Text('Subscription & Billing'),
            subtitle: const Text('View and update your subscription and billing information'),
            onTap: () {
              // Navigate to Subscription and Billing page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SubscriptionBillingPage()),
              );
            },
          ),
          const Divider(),

          // Technical Support Section
          ListTile(
            leading: const Icon(Icons.support, color: AppColors.white,),
            title: const Text('Technical Support'),
            subtitle: const Text('Get assistance with technical issues'),
            onTap: () {
              // Navigate to Technical Support page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TechnicalSupportPage()),
              );
            },
          ),
          const Divider(),

          // Feedback and Suggestions Section
          ListTile(
            leading: const Icon(Icons.feedback, color: AppColors.white,),
            title: const Text('Feedback & Suggestions'),
            subtitle: const Text('Provide feedback and suggest improvements'),
            onTap: () {
              // Navigate to Feedback and Suggestions page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackSuggestionsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Placeholder for StreamingIssuesPage
class StreamingIssuesPage extends StatelessWidget {
  const StreamingIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streaming Issues'),
      ),
      body: const Center(
        child: Text('Troubleshoot video playback and streaming problems here.'),
      ),
    );
  }
}

// Placeholder for AccountManagementPage
class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Management'),
      ),
      body: const Center(
        child: Text('Manage your account settings and preferences here.'),
      ),
    );
  }
}

// Placeholder for SubscriptionBillingPage
class SubscriptionBillingPage extends StatelessWidget {
  const SubscriptionBillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription & Billing'),
      ),
      body: const Center(
        child: Text('View and update your subscription and billing information here.'),
      ),
    );
  }
}

// Placeholder for TechnicalSupportPage
class TechnicalSupportPage extends StatelessWidget {
  const TechnicalSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Support'),
      ),
      body: const Center(
        child: Text('Get assistance with technical issues here.'),
      ),
    );
  }
}

// Placeholder for FeedbackSuggestionsPage
class FeedbackSuggestionsPage extends StatelessWidget {
  const FeedbackSuggestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback & Suggestions'),
      ),
      body: const Center(
        child: Text('Provide feedback and suggest improvements here.'),
      ),
    );
  }
}
