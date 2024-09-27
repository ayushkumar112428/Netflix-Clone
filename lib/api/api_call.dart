import 'dart:convert';
import 'package:netflixclone/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/models/tv_movie_model.dart';
import 'package:netflixclone/models/tv_show_model.dart';

class ApiCall {
  //Movie
  Future<MovieModel> fetchMovies(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          // print("API : ${data.runtimeType}");
          return MovieModel.fromJson(data);
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

  //Tv Show
  Future<TvShowModel> fetchTvShow(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          // print("API : ${data}");
          return TvShowModel.fromJson(data);
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

  //Tv And Movie
  Future<TvAndMovieModel> fetchTvAndMovies(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          // print("API : ${data.runtimeType}");
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
}
