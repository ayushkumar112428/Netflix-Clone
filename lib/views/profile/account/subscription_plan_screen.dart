import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/display_message.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  int selectedPlanIndex = 0;

  void selectPlan(int index) {
    setState(() {
      selectedPlanIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
        title: Image.asset("assets/netflix/netflixname.png",height: 30,width: 92,fit: BoxFit.fitHeight,),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth*0.5,
              child: const Text(
                "Choose the plan that's right for you",
                style: AppTextStyles.hedgingTextStyle,
              ),
            ),
            const SizedBox(height: 12,),
            const Text(
              "✓  Unlimited movies and TV shows",
              style: AppTextStyles.subTextStyle,
            ),
            const SizedBox(height: 6,),
            const Text(
              "✓  Watch ad-free",
              style: AppTextStyles.subTextStyle,
            ),
            const SizedBox(height: 6,),
            const Text(
              "✓  Change or cancel anytime",
              style: AppTextStyles.subTextStyle,
            ),
            const SizedBox(height: 50,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPlanCard(
                    planName: 'Basic',
                    price: '7.99',
                    features: [
                      {
                        'icon': 'assets/icons/mobile.png',
                        'name': 'Watch on your mobile phone and tablet',
                      },
                      {
                        'icon': 'assets/icons/eye_scanner.png',
                        'name': 'Screens you can watch on 1 at the same time',
                      },
                    ],
                    screens: 1,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    onTap: (){
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
                            customMsg: 'Basic plan successfully open.',
                            margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                          ),
                        ),
                      );
                    }
                  ),
                  _buildPlanCard(
                    planName: 'Standard',
                    price: '10.99',
                    features: [
                      {
                        'icon': 'assets/icons/hd.png',
                        'name': 'HD available',
                      },
                      {
                        'icon': 'assets/icons/tv.png',
                        'name': 'Watch on your laptop and TV',
                      },
                      {
                        'icon': 'assets/icons/mobile.png',
                        'name': 'Watch on your mobile phone and tablet',
                      },
                      {
                        'icon': 'assets/icons/eye_scanner.png',
                        'name': 'Screens you can watch on 2 at the same time',
                      },
                    ],
                    screens: 2,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                      onTap: (){
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
                              customMsg: 'Standard plan successfully open.',
                              margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                            ),
                          ),
                        );
                      }
                  ),
                  _buildPlanCard(
                    planName: 'Premium',
                    price: '13.99',
                    features: [
                      {
                        'icon': 'assets/icons/hd.png',
                        'name': 'HD available',
                      },
                      {
                        'icon': 'assets/icons/4k.png',
                        'name': '4K+HDR available',
                      },
                      {
                        'icon': 'assets/icons/tv.png',
                        'name': 'Watch on your laptop and TV',
                      },
                      {
                        'icon': 'assets/icons/mobile.png',
                        'name': 'Watch on your mobile phone and tablet',
                      },
                      {
                        'icon': 'assets/icons/eye_scanner.png',
                        'name': 'Screens you can watch on 4 at the same time',
                      },
                    ],
                    screens: 3,
                    popular: true,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                      onTap: (){
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
                              customMsg: 'Premium plan successfully open.',
                              margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                            ),
                          ),
                        );
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String planName,
    required String price,
    required List<Map<String, dynamic>> features,
    required int screens,
    required double screenWidth,
    required double screenHeight,
    required VoidCallback onTap,
    bool popular = false,
  }) {
    // Plan card width based on screen size for responsiveness.
    double cardWidth = screenWidth * 0.7;
    double cardHeight = screenHeight * 0.55;

    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: const EdgeInsets.only(right: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blackCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          planName,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                          overflow: TextOverflow.ellipsis, // Handle long text overflow
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$$price/month',
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  if (popular) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.redColor,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('🔥 Popular', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Divider(),
              ),
              const SizedBox(height: 8),
              // Wrap ListView.builder with ConstrainedBox to handle size constraints
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: cardHeight * 0.6, // Adjust this percentage as needed
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero, // Remove padding to avoid extra space
                  shrinkWrap: true,
                  itemCount: features.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Image.asset(features[index]['icon'], height: 30, width: 30,fit: BoxFit.fill,),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              features[index]['name'],
                              style: AppTextStyles.textStyle,// Handle text overflow
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          // Add the "Choose Plan" button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.submitButtonColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(child: Text('Choose Plan', style: AppTextStyles.hedgingTextStyle)),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
