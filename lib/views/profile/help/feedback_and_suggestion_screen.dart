import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/display_message.dart';
import 'package:netflixclone/widget/submit_button.dart';

class FeedbackAndSuggestions extends StatefulWidget {
  const FeedbackAndSuggestions({super.key});

  @override
  State<FeedbackAndSuggestions> createState() => _FeedbackAndSuggestionsState();
}

class _FeedbackAndSuggestionsState extends State<FeedbackAndSuggestions> {
  TextEditingController feedbackController = TextEditingController();
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
        title: const Text('Feedback & Suggestions'),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.black,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We Value Your Feedback',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Share your thoughts or suggestions to help us improve.',
              style: AppTextStyles.subTextStyle.copyWith(color: AppColors.grayText),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: feedbackController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Enter your feedback here...',
                        hintStyle: AppTextStyles.subTextStyle.copyWith(color: AppColors.grayText),
                        filled: true,
                        fillColor: AppColors.blackCard,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      style: AppTextStyles.subTextStyle.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 24),
                    SubmitButton(title: "Submit Feedback", onTap: (){_showSubmissionConfirmation(context);}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSubmissionConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.blackCard,
          title: const Text(
            'Thank You!',
            style: TextStyle(color: AppColors.white),
          ),
          content: const Text(
            'Your feedback has been submitted successfully.',
            style: TextStyle(color: AppColors.grayText),
          ),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    elevation: 0,
                    width: 540,
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.transparent,
                    content: DisplayMessage(
                      isFormError: false,
                      msgType: "success",
                      isMsgDisplayed: true,
                      allowUserToDismissMsg: true,
                      customMsg: 'Your feedback has been successfully submitted.',
                      margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                    ),
                  ),
                );
                feedbackController.clear();
                Navigator.pushReplacementNamed(context, '/BottomBar',arguments: {
                  'index' : 3,
                });
                // Navigator.pop(context);
                // Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
