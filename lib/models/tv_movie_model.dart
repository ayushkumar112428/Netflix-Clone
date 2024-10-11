// To parse this JSON data, do
//
//     final tvAndMovieModel = tvAndMovieModelFromJson(jsonString);

import 'dart:convert';

TvAndMovieModel tvAndMovieModelFromJson(String str) => TvAndMovieModel.fromJson(json.decode(str));

String tvAndMovieModelToJson(TvAndMovieModel data) => json.encode(data.toJson());

class TvAndMovieModel {
  Dates? dates;
  num page;
  List<TvAndMovieResult> results;
  num totalPages;
  num totalResults;

  TvAndMovieModel({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TvAndMovieModel.fromJson(Map<String, dynamic> json) => TvAndMovieModel(
    dates: json["dates"] != null ? Dates.fromJson(json["dates"]) : null,
    page: json["page"],
    results: List<TvAndMovieResult>.from(json["results"].map((x) => TvAndMovieResult.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "dates": dates?.toJson(),
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class TvAndMovieResult {
  num id;
  bool adult;
  List<num>? genreIds;
  String? backdropPath;
  String originalLanguage;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  num voteCount;

  String? originalTitle;
  DateTime? releaseDate;
  String? title;
  bool? video;

  String? originalName;
  DateTime? firstAirDate;
  String? name;
  List<String>? originCountry;

  MediaType? mediaType;

  TvAndMovieResult({
    required this.id,
    required this.adult,
    required this.genreIds,
    required this.backdropPath,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,

    this.originalTitle,
    this.releaseDate,
    this.title,
    this.video,

    this.originalName,
    this.firstAirDate,
    this.name,
    this.originCountry,

    this.mediaType,
  });

  factory TvAndMovieResult.fromJson(Map<String, dynamic> json) => TvAndMovieResult(
    id: json["id"],
    adult: json["adult"],
    genreIds: json["genre_ids"] != null ? List<num>.from(json["genre_ids"].map((x) => x)) : null,
    backdropPath: json["backdrop_path"] ?? '',
    originalLanguage: json["original_language"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],

    originalTitle: json["original_title"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],

    originalName: json["original_name"],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    name: json["name"],
    originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),

    mediaType: json["media_type"] == null ? null : mediaTypeValues.map[json["media_type"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "adult": adult,
    "genre_ids": genreIds != null ? List<dynamic>.from(genreIds!.map((x) => x)) : [],
    "backdrop_path": backdropPath,
    "original_language": originalLanguage,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "vote_average": voteAverage,
    "vote_count": voteCount,

    "original_title": originalTitle ,
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,

    "original_name": originalName,
    "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "name": name,
    "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),

    "media_type": mediaType == null ? null : mediaTypeValues.reverse[mediaType],
  };
}

class Dates {
  DateTime? maximum;
  DateTime? minimum;

  Dates({
    this.maximum,
    this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: json["maximum"] != null ? DateTime.parse(json["maximum"]) : null,
    minimum: json["minimum"] != null ? DateTime.parse(json["minimum"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "maximum": maximum != null ? "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}" : null,
    "minimum": minimum != null ? "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}" : null,
  };
}

enum MediaType {
  MOVIE,
  TV
}

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
