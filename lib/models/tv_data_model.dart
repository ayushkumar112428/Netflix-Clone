
import 'dart:convert';

TvShowDataModel tvShowDataModelFromJson(String str) => TvShowDataModel.fromJson(json.decode(str));

String tvShowDataModelToJson(TvShowDataModel data) => json.encode(data.toJson());

class TvShowDataModel {
  bool adult;
  String? backdropPath;  // Nullable
  List<CreatedBy> createdBy;  // Nullable or empty list
  List<num> episodeRunTime;  // Changed to num
  String? firstAirDate;  // Changed to String and Nullable
  List<Genre> genres;
  String? homepage;  // Nullable
  num id;  // Changed to num
  bool inProduction;
  List<String> languages;
  String? lastAirDate;  // Changed to String and Nullable
  TEpisodeToAir lastEpisodeToAir;
  String name;
  TEpisodeToAir nextEpisodeToAir;
  List<Network> networks;
  num numberOfEpisodes;  // Changed to num
  num numberOfSeasons;  // Changed to num
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double? popularity;  // Nullable
  String? posterPath;  // Nullable
  List<Network> productionCompanies;
  List<ProductionCountry> productionCountries;
  List<Season> seasons;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String? tagline;  // Nullable
  String type;
  double voteAverage;  // Nullable
  num voteCount;  // Changed to num

  TvShowDataModel({
    required this.adult,
    this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    this.firstAirDate,
    required this.genres,
    this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShowDataModel.fromJson(Map<String, dynamic> json) => TvShowDataModel(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    createdBy: json["created_by"] != null
        ? List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x)))
        : [],  // Handle null or empty list
    episodeRunTime: List<num>.from(json["episode_run_time"].map((x) => x)),  // Changed to num
    firstAirDate: json["first_air_date"],  // Changed to String
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],  // Changed to num
    inProduction: json["in_production"],
    languages: List<String>.from(json["languages"].map((x) => x)),
    lastAirDate: json["last_air_date"],  // Changed to String
    lastEpisodeToAir: TEpisodeToAir.fromJson(json["last_episode_to_air"]),
    name: json["name"],
    nextEpisodeToAir: TEpisodeToAir.fromJson(json["next_episode_to_air"]),
    networks: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
    numberOfEpisodes: json["number_of_episodes"],  // Changed to num
    numberOfSeasons: json["number_of_seasons"],  // Changed to num
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"],
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: List<Network>.from(json["production_companies"].map((x) => Network.fromJson(x))),
    productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
    seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
    status: json["status"],
    tagline: json["tagline"],
    type: json["type"],
    voteAverage: json["vote_average"].toDouble() ?? 0,  // Nullable
    voteCount: json["vote_count"],  // Changed to num
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
    "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),  // Changed to num
    "first_air_date": firstAirDate,  // Changed to String
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,  // Changed to num
    "in_production": inProduction,
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "last_air_date": lastAirDate,  // Changed to String
    "last_episode_to_air": lastEpisodeToAir.toJson(),
    "name": name,
    "next_episode_to_air": nextEpisodeToAir.toJson(),
    "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
    "number_of_episodes": numberOfEpisodes,  // Changed to num
    "number_of_seasons": numberOfSeasons,  // Changed to num
    "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
    "original_language": originalLanguage,
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
    "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
    "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
    "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
    "status": status,
    "tagline": tagline,
    "type": type,
    "vote_average": voteAverage,
    "vote_count": voteCount,  // Changed to num
  };
}

class CreatedBy {
  num id;  // Changed to num
  String creditId;
  String name;
  String originalName;
  int gender;
  String? profilePath;  // Nullable

  CreatedBy({
    required this.id,  // Changed to num
    required this.creditId,
    required this.name,
    required this.originalName,
    required this.gender,
    this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],  // Changed to num
    creditId: json["credit_id"],
    name: json["name"],
    originalName: json["original_name"],
    gender: json["gender"],
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,  // Changed to num
    "credit_id": creditId,
    "name": name,
    "original_name": originalName,
    "gender": gender,
    "profile_path": profilePath,
  };
}

class Genre {
  num id;  // Changed to num
  String name;

  Genre({
    required this.id,  // Changed to num
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],  // Changed to num
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,  // Changed to num
    "name": name,
  };
}

class TEpisodeToAir {
  num id;  // Changed to num
  String name;
  String overview;
  num voteAverage;  // Changed to num
  num voteCount;  // Changed to num
  String airDate;  // Changed to String
  num episodeNumber;  // Changed to num
  String episodeType;
  String productionCode;
  num? runtime;  // Changed to num and Nullable
  num seasonNumber;  // Changed to num
  num showId;  // Changed to num
  String? stillPath;  // Nullable

  TEpisodeToAir({
    required this.id,  // Changed to num
    required this.name,
    required this.overview,
    required this.voteAverage,  // Changed to num
    required this.voteCount,  // Changed to num
    required this.airDate,  // Changed to String
    required this.episodeNumber,  // Changed to num
    required this.episodeType,
    required this.productionCode,
    this.runtime,  // Changed to num and Nullable
    required this.seasonNumber,  // Changed to num
    required this.showId,  // Changed to num
    this.stillPath,
  });

  factory TEpisodeToAir.fromJson(Map<String, dynamic> json) => TEpisodeToAir(
    id: json["id"],  // Changed to num
    name: json["name"],
    overview: json["overview"],
    voteAverage: json["vote_average"],  // Changed to num
    voteCount: json["vote_count"],  // Changed to num
    airDate: json["air_date"],  // Changed to String
    episodeNumber: json["episode_number"],  // Changed to num
    episodeType: json["episode_type"],
    productionCode: json["production_code"],
    runtime: json["runtime"],  // Changed to num and Nullable
    seasonNumber: json["season_number"],  // Changed to num
    showId: json["show_id"],  // Changed to num
    stillPath: json["still_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,  // Changed to num
    "name": name,
    "overview": overview,
    "vote_average": voteAverage,  // Changed to num
    "vote_count": voteCount,  // Changed to num
    "air_date": airDate,  // Changed to String
    "episode_number": episodeNumber,  // Changed to num
    "episode_type": episodeType,
    "production_code": productionCode,
    "runtime": runtime,  // Changed to num and Nullable
    "season_number": seasonNumber,  // Changed to num
    "show_id": showId,  // Changed to num
    "still_path": stillPath,
  };
}

class Network {
  num id;  // Changed to num
  String logoPath;  // Nullable
  String name;
  String originCountry;

  Network({
    required this.id,  // Changed to num
    required this.logoPath,  // Nullable
    required this.name,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    id: json["id"],  // Changed to num
    logoPath: json["logo_path"] ?? "",  // Nullable
    name: json["name"],
    originCountry: json["origin_country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,  // Changed to num
    "logo_path": logoPath,  // Nullable
    "name": name,
    "origin_country": originCountry,
  };
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    iso31661: json["iso_3166_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iso_3166_1": iso31661,
    "name": name,
  };
}

class Season {
  String? airDate;  // Changed to String and Nullable
  num episodeCount;  // Changed to num
  num id;  // Changed to num
  String name;
  String overview;
  String? posterPath;  // Nullable
  num seasonNumber;  // Changed to num
  num voteAverage;  // Changed to num

  Season({
    this.airDate,  // Changed to String and Nullable
    required this.episodeCount,  // Changed to num
    required this.id,  // Changed to num
    required this.name,
    required this.overview,
    this.posterPath,
    required this.seasonNumber,  // Changed to num
    required this.voteAverage,  // Changed to num
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    airDate: json["air_date"],  // Changed to String
    episodeCount: json["episode_count"],  // Changed to num
    id: json["id"],  // Changed to num
    name: json["name"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    seasonNumber: json["season_number"],  // Changed to num
    voteAverage: json["vote_average"],  // Changed to num
  );

  Map<String, dynamic> toJson() => {
    "air_date": airDate,  // Changed to String
    "episode_count": episodeCount,  // Changed to num
    "id": id,  // Changed to num
    "name": name,
    "overview": overview,
    "poster_path": posterPath,
    "season_number": seasonNumber,  // Changed to num
    "vote_average": voteAverage,  // Changed to num
  };
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    englishName: json["english_name"],
    iso6391: json["iso_639_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "english_name": englishName,
    "iso_639_1": iso6391,
    "name": name,
  };
}