import 'package:flutter/material.dart';
import 'package:netflixclone/api/api_call.dart';
import 'package:netflixclone/api/url.dart';
import 'package:netflixclone/declaration/colors.dart';
import 'package:netflixclone/declaration/textstyle.dart';
import 'package:netflixclone/models/tv_movie_model.dart';
import 'package:netflixclone/widget/image_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<TvAndMovieResult>? _popularMovies;

  List<String> searchListOfData = [
    "https://image.tmdb.org/t/p/w500/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg",
    "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    "https://image.tmdb.org/t/p/w500/3ovFaFeojLFIl5ClqhtgYMDS8sE.jpg",
    "https://image.tmdb.org/t/p/w500/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg",
    "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    "https://image.tmdb.org/t/p/w500/3ovFaFeojLFIl5ClqhtgYMDS8sE.jpg",
    "https://image.tmdb.org/t/p/w500/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg",
    "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    "https://image.tmdb.org/t/p/w500/3ovFaFeojLFIl5ClqhtgYMDS8sE.jpg",
    "https://image.tmdb.org/t/p/w500/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg",
    "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    "https://image.tmdb.org/t/p/w500/3ovFaFeojLFIl5ClqhtgYMDS8sE.jpg",
    "https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg",
    "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
  ];

  // Method to call the API service and load popular movies
  Future<void> loadPopularMovies(String url) async {
    ApiCall apiCall = ApiCall();
    try {
      final movies = await apiCall.fetchTvAndMovies(url);
      // print("Movie: ${movies.results}");
      setState(() {
        _popularMovies = movies.results;
        // _isLoading = false;
      });
      // print("popularMovies: $_popularMovies");
    } catch (e) {
      // print('Error loading movies: $e');
      // setState(() {
      //   _isLoading = false;
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    loadPopularMovies(popularMovieUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            // Search Bar
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.graySearchBarColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Image.asset(
                              "assets/icons/search_icon_field.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                cursorColor: AppColors.white,
                                cursorHeight: 18,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: AppTextStyles.textStyle.copyWith(
                                    color: AppColors.grayColor,
                                    letterSpacing: 1.1,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(bottom: 7),
                                ),
                                onChanged: (value) {
                                  setState(() {}); // Update UI when text changes
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _searchController.clear();
                                });
                              },
                              child: Image.asset(
                                "assets/icons/cancel_icon.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                      },
                      child: const Text(
                        'Cancel',
                        style: AppTextStyles.textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Movie & TV",
              style: AppTextStyles.hedgingTextStyle,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(right: 6),
              width: double.infinity,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns in the grid
                  crossAxisSpacing: 0, // Space between columns
                  mainAxisSpacing: 20.0, // Space between rows
                ),
                itemCount: _popularMovies?.length ?? 0, // Set item count to the length of the list
                itemBuilder: (context, index) {
                  final movie = _popularMovies![index];
                  return ImageCard(
                    img: "$imageUrl${movie.posterPath}", // Dynamically load images from the list
                  );
                },
              ),
            ),
            // const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
