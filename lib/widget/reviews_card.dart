import 'package:flutter/material.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';

class ReviewsCard extends StatelessWidget {
  final String authorName;
  final String formattedDate;
  final String content;
  final double review;
  const ReviewsCard({
    super.key,
    required this.authorName,
    required this.formattedDate,
    required this.content,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    bool visibal = true;
    return visibal
        ? Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authorName,
                            style: AppTextStyles.textStyle,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              final reviewSetValue = (index * 2) + 1;
                              return Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  review != reviewSetValue
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded,
                                  color: review > (reviewSetValue - 1)
                                      ? Colors.amber
                                      : Colors.grey,
                                  size: 20,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          formattedDate,
                          style: AppTextStyles.subTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.subTextStyle,
                  ),
                  // const SizedBox(
                  //   height: 6,
                  // ),
                  // Divider(),
                ],
              ),
            ),
          )
        : Padding(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          authorName,
                          style: AppTextStyles.textStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            formattedDate,
                            style: AppTextStyles.subTextStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        final reviewSetValue = (index * 2) + 1;
                        return Row(
                          children: [
                            Icon(
                              review != reviewSetValue
                                  ? Icons.star_rounded
                                  : Icons.star_half_rounded,
                              color: review > (reviewSetValue - 1)
                                  ? Colors.amber
                                  : Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      content,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.subTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

// Text(
//                     formattedDate,
//                     style: AppTextStyles.subTextStyle,
//                   ),
