import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class MyNetflix extends StatefulWidget {
  const MyNetflix({super.key});

  @override
  State<MyNetflix> createState() => _MyNetflixState();
}

class _MyNetflixState extends State<MyNetflix> {
  List<Map<String, dynamic>> userData = [
    {
      "name": "Ayush",
      "color": AppColors.blueText,
    },
    {
      "name": "AAA",
      "color": AppColors.deepPurpleText,
    },
    {
      "name": "New",
      "color": AppColors.redColor,
    },
    {
      "name": "dfsd",
      "color": AppColors.deepPurpleText,
    },
  ];
  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 55,
                ),
                const Image(
                  image: AssetImage("assets/netflix/netflixname.png"),
                  height: 40,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 40,
                    ))
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Who is Watching?",
              style: AppTextStyles.largeTitleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0.0,
                ),
                itemCount: userData.length + 1,
                itemBuilder: (context, index) {
                  return index == userData.length
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    TextEditingController reviewsController =
                                        TextEditingController();
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      backgroundColor: AppColors.boxBlackColor,
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 24),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: AppColors.blueText,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/profileImage.jpg"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            "Name",
                                            style: AppTextStyles.textStyle
                                                .copyWith(
                                                    fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 8),
                                          TextField(
                                            controller: reviewsController,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Write name...',
                                              hintStyle: AppTextStyles
                                                  .subTextStyle
                                                  .copyWith(
                                                      color: AppColors.grayColor),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 12),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: AppColors.grayColor),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: AppColors.white),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actionsPadding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: const Text(
                                            'Cancel',
                                            style: AppTextStyles.textStyle,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.submitButtonColor,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            // Handle submission logic
                                            Navigator.of(context)
                                                .pop(); // Close the dialog after submission
                                          },
                                          child: const Text(
                                            'Submit',
                                            style: AppTextStyles.textStyle,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.grayColor),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 60,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Add Profile",
                              style: AppTextStyles.hedgingTextStyle,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: userData[index]['color'],
                                  borderRadius: BorderRadius.circular(6),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/profile.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              userData[index]['name'],
                              style: AppTextStyles.hedgingTextStyle,
                            ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
