import 'dart:convert';
import 'package:netflixclone/models/cast_model.dart';
import 'package:netflixclone/models/episode_list_model.dart';
import 'package:netflixclone/models/logos_poster_model.dart';
import 'package:netflixclone/models/movie_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/models/review_model.dart';
import 'package:netflixclone/models/tv_data_model.dart';
import 'package:netflixclone/models/tv_movie_model.dart';

class ApiCall {
  //Movie
  // Future<MovieModel> fetchMovies(String apiUrl) async {
  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //
  //       if (data != null) {
  //         // print("API : ${data.runtimeType}");
  //         return MovieModel.fromJson(data);
  //       } else {
  //         throw Exception('Results key is null');
  //       }
  //     } else {
  //       throw Exception('Failed to load movies');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching movies: $e');
  //   }
  // }

  //Tv Show
  // Future<TvShowModel> fetchTvShow(String apiUrl) async {
  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //
  //       if (data != null) {
  //         // print("API : ${data}");
  //         return TvShowModel.fromJson(data);
  //       } else {
  //         throw Exception('Results key is null');
  //       }
  //     } else {
  //       throw Exception('Failed to load movies');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching movies: $e');
  //   }
  // }

  //Tv And Movie
  Future<TvAndMovieModel> fetchTvAndMovies(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          // print("API : ${data}");
          // print("API :: ${TvAndMovieModel.fromJson(data)}");
          return TvAndMovieModel.fromJson(data);
        } else {
          throw Exception('Results key is null');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  //Particular Movie Data
  Future<MovieDataModel> fetchMovieData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          return MovieDataModel.fromJson(data);
        } else {
          throw Exception('Results key is null');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  //Particular Tv Show Data
  Future<TvShowDataModel> fetchTvData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          return TvShowDataModel.fromJson(data);
        } else {
          throw Exception('Results key is null');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  //Cast Data
  Future<CastModel> fetchCastData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // print("\n--------\n${data.runtimeType}");
        if (data != null) {
          return CastModel.fromJson(data);
        } else {
          throw Exception('Results key is null');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  //Logo Poster Backdrops Data
  Future<LogoPosterModel> fetchLogoPosterData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null) {
          return LogoPosterModel.fromJson(data);
        } else {
          throw Exception('Results key is null');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  //Review Data
  Future<ReviewModel> fetchReviewData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null) {
          return ReviewModel.fromJson(data);
        } else {
          throw Exception('Results key is null');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  //Episodes Data
  Future<EpisodeDataModel> fetchEpisodesData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null) {
          print(data.runtimeType);
          return EpisodeDataModel.fromJson(data);
        } else {
          throw Exception('Results key is null');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}
