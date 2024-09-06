import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/widget/poster_image_card.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  String movieName = "Deadpool & Wolverine";
  List<String> categories = [
    "TV Shows",
    "Movie",
    "Have not Started",
  ];

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
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
          "My List",
          style: AppTextStyles.hedgingTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Movie & TV Shows",
                style: AppTextStyles.hedgingTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 32,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grayColor),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                            child: Text(
                          categories[index],
                          style: AppTextStyles.textStyle,
                        )),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: SizedBox(
                      width: wSize,
                      // height: wSize * 0.562 * 0.3 + 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const PosterImageCard(
                                  posterImage:
                                      "https://image.tmdb.org/t/p/w500/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg"),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                  width: wSize * 0.4,
                                  child: Text(
                                    movieName,
                                    style: AppTextStyles.textStyle,
                                  )),
                            ],
                          ),
                          const Icon(
                            Icons.play_circle_outline_outlined,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
