import 'dart:convert';
import 'package:netflixclone/models/popular_movie_model.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<PopularMovieModel> fetchPopularMovies(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          print('hiii');
          final results = data;
          print("API : ${results}");

          return PopularMovieModel.fromJson(data);
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
