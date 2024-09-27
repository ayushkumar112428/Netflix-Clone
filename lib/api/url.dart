const String movieUrl = "https://api.themoviedb.org/3/movie/";
const String tvShowUrl = "https://api.themoviedb.org/3/tv/";
const String imageUrl = "https://image.tmdb.org/t/p/w500";
const String tvAndMovieUrl = "https://api.themoviedb.org/3/trending/all/day";

const String apiKey = "?api_key=9074445935bfc8a5b7378ed90d782f71";

const String popularMovieUrl = "${movieUrl}popular$apiKey";
const String topRatedMovieUrl = "${movieUrl}top_rated$apiKey";
const String upcomingMovieUrl = "${movieUrl}upcoming$apiKey";

const String trendingTvAndMovieUrl = "$tvAndMovieUrl$apiKey";

const String popularTVShowUrl = "${tvShowUrl}popular$apiKey";
const String airingTodayTvShowUrl = "${tvShowUrl}airing_today$apiKey";
const String topRatedTvShowUrl = "${tvShowUrl}top_rated$apiKey";