import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool myList = false;
  bool like = false;

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Movie Image
            Container(
              width: wSize,
              height: wSize * 0.562,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg"))),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Movie Name
                  Row(
                    children: [
                      const Text(
                        "Deadpool & Wolverine",
                        style: AppTextStyles.titleStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.boxBlackColor,
                        ),
                        child: Text(
                          "7.8",
                          style: AppTextStyles.hedgingTextStyle
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  // Movie Date
                  SizedBox(
                    width: wSize - 25,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "2024-07-24",
                          style: AppTextStyles.textStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "• ",
                          style: AppTextStyles.textStyle,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  index > 0
                                      ? const Text(
                                          " / ",
                                          style: AppTextStyles.textStyle,
                                        )
                                      : Container(),
                                  const Text(
                                    "Action",
                                    style: AppTextStyles.textStyle,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Movie overview
                  const Text(
                    "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
                    style: AppTextStyles.subTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Movie Play
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/Movie'),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.submitButtonColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Play",
                            style: AppTextStyles.hedgingTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Movie Dowunload
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/Movie'),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.graySearchBarColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download,
                            size: 30,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Download",
                            style: AppTextStyles.hedgingTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // List , Like and Send
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            myList = !myList;
                          });
                        },
                        child: Row(
                          children: [
                            myList
                                ? const Icon(
                                    Icons.bookmark_rounded,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.bookmark_outline,
                                    size: 30,
                                  ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              "List",
                              style: AppTextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            like = !like;
                          });
                        },
                        child: Row(
                          children: [
                            like
                                ? const Icon(
                                    Icons.thumb_up,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 30,
                                  ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              "Like",
                              style: AppTextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.send_rounded,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Send",
                              style: AppTextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Cast & Crew",
                    style: AppTextStyles.hedgingTextStyle,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Movie Credits
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500/2Orm6l3z3zukF1q0AgIOUqvwLeB.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "Acting",
                                style: AppTextStyles.subTextStyle,
                              ),
                              const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Ryan Reynolds",
                                    style: AppTextStyles.textStyle,
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Deadpool & Wolverine",
                    style: AppTextStyles.hedgingTextStyle,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Movie Images
                  SizedBox(
                    height: (wSize - 124) * 0.562,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: wSize - 124,
                            height: (wSize - 124) * 0.562,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/uvlbA5Zt9Alib6D46g84iMjnAQU.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Reviews",
                    style: AppTextStyles.hedgingTextStyle,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // Movie Reviews
                  ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero, // remove top spase
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.boxBlackColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "shammahrashad",
                                      style: AppTextStyles.textStyle,
                                    ),
                                    const SizedBox(width: 12,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(color: Colors.amberAccent)
                                      ),
                                      child: Text(
                                        "6.0",
                                        style: AppTextStyles.textStyle.copyWith(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6,),
                                Text(
                                  "Theres not much of a plot and the villains weren't that great. It was a good laugh though and amazing cameos and fight scenes.",
                                  style: AppTextStyles.subTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
