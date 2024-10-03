import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/api/api_call.dart';
import 'package:netflixclone/api/url.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/models/cast_model.dart';
import 'package:netflixclone/models/movie_data_model.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool myList = false;
  bool like = false;

  int? _id ;
  bool? _isMovie;
  MovieDataModel? data;
  List<Cast> ? castDataList;
  bool isLoading = true;

  // timestamp
  late String timestamp;
  late String formattedDate;

  // Function to load movie data
  Future<void> loadMovieData(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final movies = await apiCall.fetchMovieData(url);
      setState(() {
        data = movies;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error loading movies: $e');
    }
  }
  // Function to load cast data
  Future<void> loadCastData(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final castData = await apiCall.fetchCastData(url);
      print("++$castData");
      setState(() {
        castDataList = castData.cast;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error loading movies: $e');
    }
  }
  String _formatDate(String timestamp) {
    // Parse the timestamp to a DateTime object
    DateTime parsedDate = DateTime.parse(timestamp);
    // Format the date to "yyyy-MM-dd"
    formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    return formattedDate.toString();
  }

  @override
  void didChangeDependencies() async {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _id = arguments['id'];
    _isMovie = arguments['movie'];
    _isMovie! ? await loadMovieData("$movieUrl$_id$apiKey") : null;
    await loadCastData("$movieUrl$_id/credits$apiKey");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    // double hSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: data != null ? Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            // Movie Image and Back Icon Buttion
            Stack(
              children: [
                Container(
                  width: wSize - 12,
                  height: wSize * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: data != null
                            ? NetworkImage("$imageUrl${data!.backdropPath}")
                            : const AssetImage('assets/profileImage.jpg') as ImageProvider,
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                      )),
                )
              ],
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
                      Text(
                        _isMovie! ? data!.belongsToCollection.name : "",
                        style: AppTextStyles.hedgingTextStyle,
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
                          _isMovie! ? data!.voteAverage.round().toString() : "",
                          style: AppTextStyles.textStyle
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
                        Text(
                          _isMovie! ? _formatDate(data!.releaseDate.toString()) : "",
                          style: AppTextStyles.textStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "• ",
                          style: AppTextStyles.textStyle,
                        ),
                        // Movie genres
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _isMovie! ? data!.genres.length : 0,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  index > 0
                                      ? const Text(
                                          " / ",
                                          style: AppTextStyles.textStyle,
                                        )
                                      : Container(),
                                  Text(
                                    _isMovie! ? data!.genres[index].name : '',
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
                  Text(
                    data!.overview,
                    style: AppTextStyles.subTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Movie Play
                  InkWell(
                    onTap: () {
                      const message = SnackBar(
                        content: Text('Play Movie...'),
                        backgroundColor: Colors.green,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(message);
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            size: 44,
                            color: AppColors.black,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Play",
                            style: AppTextStyles.hedgingTextStyle.copyWith(color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Movie Download
                  InkWell(
                    onTap: () {
                      const message = SnackBar(
                        content: Text('Download Movie...'),
                        backgroundColor: Colors.green,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(message);
                    },
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            myList = !myList;
                          });
                        },
                        child: Column(
                          children: [
                            myList ? const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: AppColors.blue,
                                  )
                                : const Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                            const SizedBox(
                              width: 6,
                            ),
                            myList ? Text(
                              "My List",
                              style: AppTextStyles.textStyle.copyWith(fontSize: 14,color: AppColors.blue),
                            ) : Text(
                              "My List",
                              style: AppTextStyles.textStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            like = !like;
                          });
                        },
                        child: Column(
                          children: [
                            like ? const Icon(
                                    Icons.thumb_up,
                                    size: 30,
                                    color: AppColors.blue,
                                  )
                                : const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 30,
                                  ),
                            const SizedBox(
                              width: 6,
                            ),
                            like ? Text(
                              "Like",
                              style: AppTextStyles.textStyle.copyWith(color: AppColors.blue),
                            ) : const Text(
                              "Like",
                              style: AppTextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50,),
                      InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            Icon(
                              Icons.send_rounded,
                              size: 30,
                            ),
                            SizedBox(
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
                  // SizedBox(
                  //   height: 170,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: moveCastDetails['cast'].length,
                  //     itemBuilder: (context, index) {
                  //       final String nameOfCast =
                  //           moveCastDetails['cast'][index]['name'] ?? '';
                  //       final String departmentOfCast = moveCastDetails['cast']
                  //               [index]['known_for_department'] ??
                  //           '';
                  //       final String imageOfCast =
                  //           "https://image.tmdb.org/t/p/w500${moveCastDetails['cast'][index]['profile_path']}";
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 12),
                  //         child: Column(
                  //           children: [
                  //             ClipOval(
                  //               child: Image.network(
                  //                 imageOfCast,
                  //                 width: 100,
                  //                 height: 100,
                  //                 fit: BoxFit.cover,
                  //                 loadingBuilder:
                  //                     (context, child, loadingProgress) {
                  //                   if (loadingProgress == null) {
                  //                     return child;
                  //                   } else {
                  //                     return const Center(
                  //                       child: CircularProgressIndicator(),
                  //                     );
                  //                   }
                  //                 },
                  //                 errorBuilder: (context, error, stackTrace) {
                  //                   return Image.asset(
                  //                     "assets/userImageNotFound.jpg",
                  //                     width: 100,
                  //                     height: 100,
                  //                     fit: BoxFit.cover,
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 3,
                  //             ),
                  //             Text(
                  //               departmentOfCast,
                  //               style: AppTextStyles.subTextStyle,
                  //             ),
                  //             SizedBox(
                  //                 width: 110,
                  //                 child: Text(
                  //                   nameOfCast,
                  //                   style: AppTextStyles.textStyle,
                  //                   textAlign: TextAlign.center,
                  //                 )),
                  //           ],
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   "name",
                  //   style: AppTextStyles.hedgingTextStyle,
                  // ),
                  // const SizedBox(
                  //   height: 7,
                  // ),
                  // // Movie Images
                  // SizedBox(
                  //   height: (wSize - 124) * 0.562,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 20),
                  //         child: Container(
                  //           width: wSize - 124,
                  //           height: (wSize - 124) * 0.562,
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(12),
                  //             image: const DecorationImage(
                  //               image: NetworkImage(
                  //                   "https://image.tmdb.org/t/p/w500/uvlbA5Zt9Alib6D46g84iMjnAQU.jpg"),
                  //               fit: BoxFit.fill,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Text(
                  //   "Reviews",
                  //   style: AppTextStyles.hedgingTextStyle,
                  // ),
                  // const SizedBox(
                  //   height: 7,
                  // ),
                  // // Movie add reviews
                  // InkWell(
                  //   onTap: () {
                  //     showDialog(
                  //       barrierDismissible: false,
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         TextEditingController reviewsController =
                  //             TextEditingController();
                  //         int? selectedRating;
                  //         return AlertDialog(
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //           ),
                  //           backgroundColor: AppColors.boxBlackColor,
                  //           contentPadding: const EdgeInsets.symmetric(
                  //               vertical: 20, horizontal: 24),
                  //           content: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Share Your Review",
                  //                 style: AppTextStyles.titleStyle
                  //                     .copyWith(fontSize: 20),
                  //               ),
                  //               SizedBox(
                  //                 height: 6,
                  //                 width: wSize - 30,
                  //               ),
                  //               const Divider(color: AppColors.grayColor),
                  //               const SizedBox(height: 16),
                  //               Text(
                  //                 "Rating : ",
                  //                 style: AppTextStyles.textStyle
                  //                     .copyWith(fontWeight: FontWeight.bold),
                  //               ),
                  //               const SizedBox(height: 8),
                  //               DropdownButtonFormField<int>(
                  //                 value: selectedRating,
                  //                 dropdownColor: AppColors.boxBlackColor,
                  //                 decoration: InputDecoration(
                  //                   contentPadding: const EdgeInsets.symmetric(
                  //                       vertical: 12, horizontal: 12),
                  //                   enabledBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: AppColors.grayColor),
                  //                     borderRadius: BorderRadius.circular(8),
                  //                   ),
                  //                   focusedBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: AppColors.white),
                  //                     borderRadius: BorderRadius.circular(8),
                  //                   ),
                  //                 ),
                  //                 items: List.generate(10, (index) => index + 1)
                  //                     .map((rating) => DropdownMenuItem<int>(
                  //                           value: rating,
                  //                           child: Text(
                  //                             rating.toString(),
                  //                             style: AppTextStyles.textStyle,
                  //                           ),
                  //                         ))
                  //                     .toList(),
                  //                 onChanged: (value) {
                  //                   selectedRating = value;
                  //                 },
                  //                 hint: const Text(
                  //                   "Select Rating",
                  //                   style: AppTextStyles.subTextStyle,
                  //                 ),
                  //               ),
                  //               const SizedBox(height: 16),
                  //               Text(
                  //                 "Review :",
                  //                 style: AppTextStyles.textStyle
                  //                     .copyWith(fontWeight: FontWeight.bold),
                  //               ),
                  //               const SizedBox(height: 8),
                  //               TextField(
                  //                 controller: reviewsController,
                  //                 decoration: InputDecoration(
                  //                   hintText: 'Write your review here...',
                  //                   hintStyle: AppTextStyles.subTextStyle
                  //                       .copyWith(color: AppColors.grayColor),
                  //                   contentPadding: const EdgeInsets.symmetric(
                  //                       vertical: 12, horizontal: 12),
                  //                   enabledBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: AppColors.grayColor),
                  //                     borderRadius: BorderRadius.circular(6),
                  //                   ),
                  //                   focusedBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: AppColors.white),
                  //                     borderRadius: BorderRadius.circular(6),
                  //                   ),
                  //                 ),
                  //                 maxLines: 4,
                  //               ),
                  //             ],
                  //           ),
                  //           actionsPadding: const EdgeInsets.symmetric(
                  //               horizontal: 16, vertical: 8),
                  //           actions: [
                  //             TextButton(
                  //               onPressed: () {
                  //                 Navigator.of(context)
                  //                     .pop(); // Close the dialog
                  //               },
                  //               child: const Text(
                  //                 'Cancel',
                  //                 style: AppTextStyles.textStyle,
                  //               ),
                  //             ),
                  //             ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                 backgroundColor: AppColors.submitButtonColor,
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 24, vertical: 12),
                  //                 shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(8),
                  //                 ),
                  //               ),
                  //               onPressed: () {
                  //                 // Handle submission logic
                  //                 Navigator.of(context)
                  //                     .pop(); // Close the dialog after submission
                  //               },
                  //               child: const Text(
                  //                 'Submit',
                  //                 style: AppTextStyles.textStyle,
                  //               ),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 40,
                  //     padding: const EdgeInsets.only(left: 12),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(6),
                  //         border: Border.all(color: AppColors.grayColor)),
                  //     child: Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: Text(
                  //           "Share your Reviews on ${data!.belongsToCollection.name}.",
                  //           style: AppTextStyles.subTextStyle,
                  //         )),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 7,
                  // ),
                  // Movie Reviews
                  // ListView.builder(
                  //   itemCount: (displayedReviewItemCount < totalItemCount)
                  //       ? displayedReviewItemCount
                  //       : totalItemCount,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   padding: EdgeInsets.zero, // remove top spase
                  //   itemBuilder: (context, index) {
                  //     _formatDate(index);
                  //     final review = movieDetails['results'][index]
                  //             ['author_details']['rating'] ??
                  //         0.0;
                  //     final authorName = movieDetails['results'][index]
                  //             ['author_details']['username'] ??
                  //         'Unknown';
                  //     final content =
                  //         movieDetails['results'][index]['content'] ?? '';
                  //     return Column(
                  //       children: [
                  //         ReviewsCard(
                  //             authorName: authorName,
                  //             formattedDate: formattedDate,
                  //             content: content,
                  //             review: review),
                  //         (index < displayedReviewItemCount-1) ? (index < totalItemCount-1) ? const Divider() : Container() :Container(),
                  //       ],
                  //     );
                  //   },
                  // ),
                  // if (displayedReviewItemCount < totalItemCount)
                  //   Align(
                  //     alignment: Alignment.centerRight,
                  //     child: TextButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           // Increase the displayed item count by 10 more each time
                  //           displayedReviewItemCount += 10;
                  //         });
                  //       },
                  //       child: const Text('Show More...',style: AppTextStyles.textStyle,),
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //   height: 10,
                  // ),
                  // const Text("More Like This",style: AppTextStyles.hedgingTextStyle,),
                  // const SizedBox(height: 7,),
                  // SizedBox(
                  //   height: 250 * 0.7,
                  //   child: ListView.builder(
                  //     itemCount: 7,
                  //     padding: EdgeInsets.zero,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return const ImageCard(img: "https://image.tmdb.org/t/p/w500/oGythE98MYleE6mZlGs5oBGkux1.jpg");
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ) :
        const Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}
