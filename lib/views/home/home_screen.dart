import 'package:flutter/material.dart';
import 'package:netflixclone/api/api_call.dart';
import 'package:netflixclone/api/url.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/models/tv_movie_model.dart';
import 'package:netflixclone/widget/icon_text_ontap_column.dart';
import 'package:netflixclone/widget/image_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TvAndMovieResult>? _popularMovies;
  List<TvAndMovieResult>? _popularTvShow;
  List<TvAndMovieResult>? _topRatedMovies;
  List<TvAndMovieResult>? _upcomingMovies;
  List<TvAndMovieResult>? _trendingTvAndMovies;
  List<TvAndMovieResult>? _airingTodayTvShow;
  List<TvAndMovieResult>? _topRatedTvShow;
  int _carouselIndex = 0;
  bool _isLoading = true;

  // Method to call the API service and load popular movies
  Future<void> loadPopularMovies(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final movies = await apiCall.fetchTvAndMovies(url);
      // print("Movie: ${movies.results.runtimeType}");
      setState(() {
        _popularMovies = movies.results;
        _isLoading = false;
      });
      // print("popularMovies: $_popularMovies");
    } catch (e) {
      // print('Error loading movies: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Method to call the API service and load popular tv show
  Future<void> loadPopularTvShow(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final tv = await apiCall.fetchTvAndMovies(url);
      // print("Movie: ${tv.results}");
      setState(() {
        _popularTvShow = tv.results;
        _isLoading = false;
      });
      // print("popularTvShow: $_popularTvShow");
    } catch (e) {
      // print('Error loading movies: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Method to call the API service and load top rated movies
  Future<void> loadTopRatedMovies(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final movies = await apiCall.fetchTvAndMovies(url);
      setState(() {
        _topRatedMovies = movies.results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Method to call the API service and load top rated movies
  Future<void> loadUpcomingMovies(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final movies = await apiCall.fetchTvAndMovies(url);
      setState(() {
        _upcomingMovies = movies.results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Method to call the API service and load trending tv and movies
  Future<void> loadTrendingTvAndMovies(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final movies = await apiCall.fetchTvAndMovies(url);
      setState(() {
        _trendingTvAndMovies = movies.results.cast<TvAndMovieResult>();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Method to call the API service and load airing today tv show
  Future<void> loadAiringTodayTvShow(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final tv = await apiCall.fetchTvAndMovies(url);
      setState(() {
        _airingTodayTvShow = tv.results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Method to call the API service and load airing today tv show
  Future<void> loadTopRatedTvShow(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final tv = await apiCall.fetchTvAndMovies(url);
      setState(() {
        _topRatedTvShow = tv.results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadPopularMovies(popularMovieUrl);
    loadPopularTvShow(popularTVShowUrl);
    loadTopRatedMovies(topRatedMovieUrl);
    loadUpcomingMovies(upcomingMovieUrl);
    loadTrendingTvAndMovies(trendingTvAndMovieUrl);
    loadAiringTodayTvShow(airingTodayTvShowUrl);
    loadTopRatedTvShow(topRatedTvShowUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double homePageImageHeight = wSize * 3 / 2;

    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
        children: [
          const SizedBox(height: 10),
          // AppBar
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/netflix/netflixN.png"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/cast_icon.png",
                      height: 40,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/icons/user_icon.png",
                      height: 36,
                      width: 36,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Center Image
          SizedBox(
            width: wSize,
            height: homePageImageHeight,
            child: Stack(
              children: [
                // Image
                _trendingTvAndMovies==null ? SizedBox(
                  width: wSize,
                  height: homePageImageHeight,
                ): SizedBox(
                  width: wSize,
                  height: homePageImageHeight,
                  child: Image.network(
                    "$imageUrl${_trendingTvAndMovies![_carouselIndex].posterPath}",
                    height: homePageImageHeight,
                    width: wSize,
                    fit: BoxFit.fill,
                  ),
                ),
                // Change image onTap
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            int index = _trendingTvAndMovies!.length;
                            if(_carouselIndex == 0){
                              _carouselIndex = index-1;

                            }else{
                              _carouselIndex -= 1;
                            }
                          });
                        },
                        child: SizedBox(
                          height: homePageImageHeight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            int index = _trendingTvAndMovies!.length;
                            if(_carouselIndex == index-1){
                              _carouselIndex = 0;
                            }else{
                              _carouselIndex += 1;
                            }
                          });
                        },
                        child: SizedBox(
                          height: homePageImageHeight,
                        ),
                      ),
                    ),
                  ],
                ),
                // Top to Bottom Shadow
                Container(
                  width: wSize,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: AppColors().homeImageTopToBottom,
                  ),
                ),
                // Bottom to Top Shadow
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: wSize,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: AppColors().homeImageBottomToTop,
                    ),
                  ),
                ),
                // Top row movie, TV Shows, Categories
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Movie", style: AppTextStyles.textButtonTextStyle),
                      Text("TV Shows", style: AppTextStyles.textButtonTextStyle),
                      Text("Categories", style: AppTextStyles.textButtonTextStyle),
                    ],
                  ),
                ),
                // Bottom row my list, play, and info
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    width: wSize,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconTextOnTapColumn(
                            img: "assets/icons/add_icon.png",
                            title: "My List",
                            onTap: () {},
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, '/Movie', arguments: {
                              "id":_trendingTvAndMovies![_carouselIndex].id,
                              "movie": _trendingTvAndMovies![_carouselIndex].mediaType==MediaType.MOVIE ? true : false,
                            },),
                            child: Container(
                              width: 120,
                              height: 45,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/play_icon.png",
                                    height: 28,
                                    width: 28,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    "Play",
                                    style: AppTextStyles.hedgingTextStyle.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconTextOnTapColumn(
                            img: "assets/icons/info_icon.png",
                            title: "Info",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Popular Movie", style: AppTextStyles.hedgingTextStyle),
                const SizedBox(height: 3),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: _popularMovies?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = _popularMovies![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Movie',arguments: {
                            "id":movie.id,
                            "movie": true,
                          });
                        },
                        child: ImageCard(
                          img: "$imageUrl${movie.posterPath}", // Fixed URL to use movie poster path
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Popular TV Series", style: AppTextStyles.hedgingTextStyle),
                const SizedBox(height: 3),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: _popularTvShow?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final tv = _popularTvShow![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Movie',arguments: {
                            "id":tv.id,
                            "movie": false,
                          });
                        },
                        child: ImageCard(
                          img: "$imageUrl${tv.posterPath}",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Top Rated Movie", style: AppTextStyles.hedgingTextStyle),
                const SizedBox(height: 3),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: _topRatedMovies?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = _topRatedMovies![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Movie',arguments: {
                            "id":movie.id,
                            "movie": true,
                          });
                        },
                        child: ImageCard(
                          img: "$imageUrl${movie.posterPath}",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Upcoming Movie", style: AppTextStyles.hedgingTextStyle),
                const SizedBox(height: 3),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: _upcomingMovies?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = _upcomingMovies![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Movie',arguments: {
                            "id":movie.id,
                            "movie": true,
                          });
                        },
                        child: ImageCard(
                          img: "$imageUrl${movie.posterPath}",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Trending Movie & TV Shows", style: AppTextStyles.hedgingTextStyle),
                const SizedBox(height: 3),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: _trendingTvAndMovies?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = _trendingTvAndMovies![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Movie',arguments: {
                            "id":movie.id,
                            "movie": _trendingTvAndMovies![index].mediaType==MediaType.MOVIE ? true : false,
                          });
                        },
                        child: ImageCard(
                          img: "$imageUrl${movie.posterPath}",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Airing Today TV Series", style: AppTextStyles.hedgingTextStyle),
                const SizedBox(height: 3),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: _airingTodayTvShow?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = _airingTodayTvShow![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Movie',arguments: {
                            "id":movie.id,
                            "movie": false,
                          });
                        },
                        child: ImageCard(
                          img: "$imageUrl${movie.posterPath}",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Top Rated TV Series", style: AppTextStyles.hedgingTextStyle),
                SizedBox(
                  height: 250 * 0.7,
                  child: ListView.builder(
                    itemCount: _topRatedTvShow?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = _topRatedTvShow![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/Movie',arguments: {
                            "id":movie.id,
                            "movie": false,
                          });
                        },
                        child: ImageCard(
                          img: "$imageUrl${movie.posterPath}",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
