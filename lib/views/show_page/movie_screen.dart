import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/api/api_call.dart';
import 'package:netflixclone/api/url.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/models/cast_model.dart';
import 'package:netflixclone/models/episode_list_model.dart';
import 'package:netflixclone/models/logos_poster_model.dart';
import 'package:netflixclone/models/movie_data_model.dart';
import 'package:netflixclone/models/review_model.dart';
import 'package:netflixclone/models/tv_data_model.dart';
import 'package:netflixclone/models/tv_movie_model.dart';
import 'package:netflixclone/views/show_page/episode_part.dart';
import 'package:netflixclone/widget/image_card.dart';
import 'package:netflixclone/widget/reviews_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool myList = false;
  bool like = false;
  int displayedReviewItemCount = 7;
  int? reviewLength;

  int? _id;
  bool? _isMovie;
  MovieDataModel? movieData;
  TvShowDataModel? tvData;
  List<Cast>? castDataList;
  List<Backdrop>? imageDataList;
  List<ReviewResult>? reviewDataList;
  List<TvAndMovieResult>? recommendationDataList;
  EpisodeDataModel? episodeData;
  List<Episode>? episodeListData;
  bool isLoading = true;

  // timestamp
  late String formattedDate;

  // Function to load movie data
  Future<void> loadMovieData(String url) async {
    setState(() {
      isLoading = true;
    });
    ApiCall apiCall = ApiCall();
    try {
      final fetchData = await apiCall.fetchMovieData(url);
      setState(() {
        movieData = fetchData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to load tv show data
  Future<void> loadTvData(String url) async {
    setState(() {
      isLoading = true;
    });
    ApiCall apiCall = ApiCall();
    try {
      final fetchData = await apiCall.fetchTvData(url);
      // print("****${fetchData.toString()}\n$movieData");
      setState(() {
        tvData = fetchData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to load cast data
  Future<void> loadCastData(String url) async {
    setState(() {
      isLoading = true;
    });
    ApiCall apiCall = ApiCall();
    try {
      final castData = await apiCall.fetchCastData(url);
      setState(() {
        castDataList = castData.cast;
        if(castDataList!.isEmpty){
          castDataList = null;
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Method to call the API service and load recommendation movies
  Future<void> loadRecommendation(String url) async {
    setState(() {
      isLoading = true;
    });
    ApiCall apiCall = ApiCall();
    try {
      final recommendations = await apiCall.fetchTvAndMovies(url);
      setState(() {
        recommendationDataList = recommendations.results;
        if(recommendationDataList!.isEmpty){
          recommendationDataList = null;
        }
        isLoading = false;
      });
      // print("popularMovies: $_popularMovies");
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to load image data
  Future<void> loadImageData(String url) async {
    setState(() {
      isLoading = true;
    });
    ApiCall apiCall = ApiCall();
    try {
      final imageData = await apiCall.fetchLogoPosterData(url);
      setState(() {
        imageDataList = imageData.backdrops;
        if(imageDataList!.isEmpty){
          imageDataList = null;
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to load review data
  Future<void> loadReviewData(String url) async {
    setState(() {
      isLoading = true;
    });
    ApiCall apiCall = ApiCall();
    try {
      final reviewData = await apiCall.fetchReviewData(url);
      setState(() {
        reviewDataList = reviewData.results;
        reviewLength = reviewDataList!.length;
        if(reviewDataList!.isEmpty){
          reviewDataList = null;
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to load episodes data
  Future<void> loadEpisodesData(String url) async {
    setState(() {
      isLoading = true;
    });
    ApiCall apiCall = ApiCall();
    try {
      final epData = await apiCall.fetchEpisodesData(url);
      setState(() {
        episodeData = epData;
        episodeListData = epData.episodes;
        if(episodeData!.episodes.isEmpty){
          episodeListData = null;
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
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
    setState(() {
      isLoading = true;
    });
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _id = arguments['id'];
    _isMovie = arguments['movie'];
    print("\n-----------------------\n$_id");
    _isMovie! ? await loadMovieData("$movieUrl$_id$apiKey") : loadTvData("$tvShowUrl$_id$apiKey");
    _isMovie! ? await loadCastData("$movieUrl$_id/credits$apiKey") : await loadCastData("$tvShowUrl$_id/credits$apiKey");
    _isMovie! ? await loadRecommendation("$movieUrl$_id/recommendations$apiKey") : await loadRecommendation("$tvShowUrl$_id/recommendations$apiKey");
    _isMovie! ? await loadImageData("$movieUrl$_id/images$apiKey") : loadImageData("$tvShowUrl$_id/images$apiKey");
    _isMovie! ? await loadReviewData("$movieUrl$_id/reviews$apiKey") : await loadReviewData("$tvShowUrl$_id/reviews$apiKey");
    _isMovie! ? null : loadEpisodesData("$tvShowUrl$_id/season/1$apiKey");

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    // double hSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: !isLoading && (movieData != null || tvData != null)
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // Movie Image and Back Icon Button
                    Stack(
                      children: [
                        Container(
                          width: wSize - 12,
                          height: wSize * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: _isMovie! ? NetworkImage("$imageUrl${movieData!.backdropPath}")
                                    : NetworkImage("$imageUrl${tvData!.backdropPath}"),
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
                                _isMovie! ? movieData!.title : tvData!.name,
                                style: AppTextStyles.hedgingTextStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.boxBlackColor,
                                ),
                                child: Text(
                                  _isMovie!
                                      ? movieData!.voteAverage.round().toString()
                                      : tvData!.voteAverage.round().toString(),
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
                                  _isMovie!
                                      ? _formatDate(movieData!.releaseDate.toString())
                                      : _formatDate(tvData!.firstAirDate.toString()),
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
                                    itemCount:
                                        _isMovie! ? movieData!.genres.length : tvData!.genres.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          index > 0
                                              ? const Text(
                                                  " / ",
                                                  style:
                                                      AppTextStyles.textStyle,
                                                )
                                              : Container(),
                                          Text(
                                            _isMovie!
                                                ? movieData!.genres[index].name.toString()
                                                : tvData!.genres[index].name.toString(),
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
                            _isMovie! ? movieData!.overview : tvData!.overview,
                            style: AppTextStyles.subTextStyle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Movie Play
                          InkWell(
                            onTap: () {
                              const message = SnackBar(
                                duration: Duration(seconds: 2),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                    style: AppTextStyles.hedgingTextStyle
                                        .copyWith(color: AppColors.black),
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
                                duration: Duration(seconds: 2),
                                content: Text('Download Movie...'),
                                backgroundColor: Colors.green,
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(message);
                            },
                            child: Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                    myList
                                        ? const Icon(
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
                                    myList
                                        ? Text(
                                            "My List",
                                            style: AppTextStyles.textStyle
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.blue),
                                          )
                                        : Text(
                                            "My List",
                                            style: AppTextStyles.textStyle
                                                .copyWith(fontSize: 14),
                                          ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    like = !like;
                                  });
                                },
                                child: Column(
                                  children: [
                                    like
                                        ? const Icon(
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
                                    like
                                        ? Text(
                                            "Like",
                                            style: AppTextStyles.textStyle
                                                .copyWith(
                                                    color: AppColors.blue),
                                          )
                                        : const Text(
                                            "Like",
                                            style: AppTextStyles.textStyle,
                                          ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
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
                          castDataList != null ? const Text(
                            "Cast & Crew",
                            style: AppTextStyles.hedgingTextStyle,
                          ) : const SizedBox(),
                          castDataList != null ? const SizedBox(
                            height: 7,
                          ) : const SizedBox(),
                          // Movie Credits
                          castDataList != null ? SizedBox(
                            height: 170,
                            child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: castDataList!.length,
                                    itemBuilder: (context, index) {
                                      final String nameOfCast =
                                          castDataList![index].name.toString();
                                      final String departmentOfCast =
                                          castDataList![index]
                                              .knownForDepartment
                                              .toString();
                                      final String imageOfCast =
                                          "$imageUrl${castDataList![index].profilePath}";
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12),
                                        child: Column(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                imageOfCast,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  } else {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(color: AppColors.white,),
                                                    );
                                                  }
                                                },
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    "assets/userImageNotFound.jpg",
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              departmentOfCast,
                                              style: AppTextStyles.subTextStyle,
                                            ),
                                            SizedBox(
                                                width: 110,
                                                child: Text(
                                                  nameOfCast,
                                                  style:
                                                      AppTextStyles.textStyle,
                                                  textAlign: TextAlign.center,
                                                )),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                          ) : const SizedBox(),
                          recommendationDataList != null ? const Text(
                            "More Like This",
                            style: AppTextStyles.hedgingTextStyle,
                          ) : const SizedBox(),
                          recommendationDataList != null ? const SizedBox(
                            height: 7,
                          ) : const SizedBox(),
                          recommendationDataList != null ? SizedBox(
                            height: 250 * 0.7,
                            child: ListView.builder(
                                    itemCount:
                                        recommendationDataList!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return ImageCard(
                                        img: "$imageUrl${recommendationDataList![index].posterPath}",
                                      );
                                    },
                                  )
                          ) : const SizedBox(),
                          imageDataList != null ? const SizedBox(
                            height: 20,
                          ) : const SizedBox(),
                          imageDataList != null ? Text(
                            _isMovie! ? movieData!.title : tvData!.name,
                            style: AppTextStyles.hedgingTextStyle,
                          ): const SizedBox(),
                          imageDataList != null ? const SizedBox(
                            height: 7,
                          ) : const SizedBox(),
                          // Movie Images
                          imageDataList != null ? SizedBox(
                            height: (wSize - 124) * 0.562,
                            child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imageDataList!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Container(
                                          width: wSize - 124,
                                          height: (wSize - 124) * 0.562,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "$imageUrl${imageDataList![index].filePath}"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                          ) : const SizedBox(),
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
                          // Movie add reviews
                          InkWell(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  TextEditingController reviewsController =
                                      TextEditingController();
                                  int? selectedRating;
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
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Share Your Review",
                                          style: AppTextStyles.titleStyle
                                              .copyWith(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 6,
                                          width: wSize - 30,
                                        ),
                                        const Divider(
                                            color: AppColors.grayColor),
                                        const SizedBox(height: 16),
                                        Text(
                                          "Rating : ",
                                          style: AppTextStyles.textStyle
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        DropdownButtonFormField<int>(
                                          value: selectedRating,
                                          dropdownColor:
                                              AppColors.boxBlackColor,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 12),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.grayColor),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.white),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          items: List.generate(
                                                  10, (index) => index + 1)
                                              .map((rating) =>
                                                  DropdownMenuItem<int>(
                                                    value: rating,
                                                    child: Text(
                                                      rating.toString(),
                                                      style: AppTextStyles
                                                          .textStyle,
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            selectedRating = value;
                                          },
                                          hint: const Text(
                                            "Select Rating",
                                            style: AppTextStyles.subTextStyle,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          "Review :",
                                          style: AppTextStyles.textStyle
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        TextField(
                                          controller: reviewsController,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Write your review here...',
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
                                          maxLines: 4,
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
                                              horizontal: 24, vertical: 12),
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
                              width: double.infinity,
                              height: 40,
                              padding: const EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: AppColors.grayColor)),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: _isMovie! ? Text(
                                    "Share your Reviews on ${movieData!.title}",
                                    style: AppTextStyles.subTextStyle,
                                  ) : Text(
                                    "Share your Reviews on ${tvData!.name}",
                                    style: AppTextStyles.subTextStyle,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          // Movie Reviews
                          reviewDataList != null
                              ? ListView.builder(
                                  itemCount:
                                      (displayedReviewItemCount < reviewLength!)
                                          ? displayedReviewItemCount
                                          : reviewLength,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero, // remove top spase
                                  itemBuilder: (context, index) {
                                    // _formatDate(index);
                                    final review = reviewDataList![index]
                                        .authorDetails
                                        .rating;
                                    final userName = reviewDataList![index]
                                        .authorDetails
                                        .username;
                                    final content =
                                        reviewDataList![index].content;
                                    return Column(
                                      children: [
                                        ReviewsCard(
                                            authorName: userName,
                                            formattedDate: _formatDate(
                                                reviewDataList![index]
                                                    .updatedAt
                                                    .toString()),
                                            content: content,
                                            review: review!.toDouble()),
                                        (index < displayedReviewItemCount - 1)
                                            ? (index < reviewLength! - 1)
                                                ? const Divider()
                                                : Container()
                                            : Container(),
                                      ],
                                    );
                                  },
                                )
                              : const SizedBox(),
                          if (displayedReviewItemCount < (reviewLength ?? 0))
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    // Increase the displayed item count by 10 more each time
                                    displayedReviewItemCount += 10;
                                  });
                                },
                                child: const Text(
                                  'Show More...',
                                  style: AppTextStyles.textStyle,
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          _isMovie! && episodeListData == null ? const SizedBox()
                              : EpisodePart(id: _id!,name:  tvData!.overview, episodeData: episodeData!, episodeListData: episodeListData!,),
                          // ListView.builder(
                          //         shrinkWrap: true,
                          //         physics: const NeverScrollableScrollPhysics(),
                          //         itemCount: episodeListData?.length,
                          //         itemBuilder: (context, index){
                          //           return Container();
                          //         },
                          //     ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/BottomBar");
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                        )),
                    const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      ),
                  ],
                ),
              )),
    );
  }
}
