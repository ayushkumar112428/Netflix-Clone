import 'dart:convert';

EpisodeDataModel episodeDataListModelFromJson(String str) => EpisodeDataModel.fromJson(json.decode(str));

String episodeDataListModelToJson(EpisodeDataModel data) => json.encode(data.toJson());

class EpisodeDataModel {
  String id;
  String? airDate;
  List<Episode> episodes;
  String? name;
  String? overview;
  num? episodeDataListModelId;
  String? posterPath;
  num? seasonNumber;
  num? voteAverage;

  EpisodeDataModel({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.episodeDataListModelId,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory EpisodeDataModel.fromJson(Map<String, dynamic> json) =>
      EpisodeDataModel(
        id: json["_id"] ?? '', // Provide a default empty string
        airDate: json["air_date"] ?? '', // Default empty string
        episodes: json["episodes"] != null
            ? List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x)))
            : [], // Provide empty list if null
        name: json["name"] ?? '', // Default empty string
        overview: json["overview"] ?? '', // Default empty string
        episodeDataListModelId: json["id"] ?? 0, // Default to 0 if null
        posterPath: json["poster_path"] ?? '', // Default empty string
        seasonNumber: json["season_number"] ?? 1, // Default to 1 if null
        voteAverage: json["vote_average"] ?? 0, // Default to 0 if null
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "air_date": airDate,
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
    "name": name,
    "overview": overview,
    "id": episodeDataListModelId,
    "poster_path": posterPath,
    "season_number": seasonNumber,
    "vote_average": voteAverage,
  };
}

class Episode {
  String? airDate;
  num? episodeNumber;
  String? episodeType;
  num id;
  String name;
  String? overview;
  String? productionCode;
  num? runtime;
  num? seasonNumber;
  num showId;
  String? stillPath;
  num? voteAverage;
  num? voteCount;
  List<dynamic>? crew;
  List<GuestStar>? guestStars;

  Episode({
    required this.airDate,
    required this.episodeNumber,
    this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    this.crew,
    this.guestStars,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    airDate: json["air_date"] ?? '', // Default empty string
    episodeNumber: json["episode_number"] ?? 1, // Default to 1
    episodeType: json["episode_type"], // Nullable
    id: json["id"], // Required
    name: json["name"] ?? '', // Default empty string
    overview: json["overview"] ?? '', // Default empty string
    productionCode: json["production_code"] ?? '', // Default empty string
    runtime: json["runtime"] ?? 0, // Default to 0
    seasonNumber: json["season_number"] ?? 1, // Default to 1
    showId: json["show_id"], // Required
    stillPath: json["still_path"] ?? '', // Default empty string
    voteAverage: json["vote_average"] ?? 0, // Default to 0
    voteCount: json["vote_count"] ?? 0, // Default to 0
    crew: json["crew"] != null ? List<dynamic>.from(json["crew"].map((x) => x)) : [], // Default empty list if null
    guestStars: json["guest_stars"] != null ? List<GuestStar>.from(json["guest_stars"].map((x) => GuestStar.fromJson(x))) : [], // Default empty list if null
  );

  Map<String, dynamic> toJson() => {
    "air_date": airDate,
    "episode_number": episodeNumber,
    "episode_type": episodeType,
    "id": id,
    "name": name,
    "overview": overview,
    "production_code": productionCode,
    "runtime": runtime,
    "season_number": seasonNumber,
    "show_id": showId,
    "still_path": stillPath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "crew": crew != null ? List<dynamic>.from(crew!.map((x) => x)) : null,
    "guest_stars": guestStars != null
        ? List<dynamic>.from(guestStars!.map((x) => x.toJson()))
        : null,
  };
}

class GuestStar {
  String character;
  String creditId;
  num order;
  bool adult;
  num gender;
  num id;
  String knownForDepartment;
  String name;
  String originalName;
  double? popularity;
  String? profilePath;

  GuestStar({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) => GuestStar(
    character: json["character"] ?? '', // Default empty string
    creditId: json["credit_id"] ?? '', // Default empty string
    order: json["order"] ?? 0, // Default to 0
    adult: json["adult"] ?? true, // Default to true
    gender: json["gender"] ?? 0, // Default to 0
    id: json["id"], // Required
    knownForDepartment: json["known_for_department"] ?? '', // Default empty string
    name: json["name"] ?? '', // Default empty string
    originalName: json["original_name"] ?? '', // Default empty string
    popularity: json["popularity"]?.toDouble() ?? 0.0, // Default to 0.0
    profilePath: json["profile_path"] ?? '', // Default empty string
  );

  Map<String, dynamic> toJson() => {
    "character": character,
    "credit_id": creditId,
    "order": order,
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": knownForDepartment,
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath,
  };
}
