import 'package:themoviedb_app/constants.dart';

class ApiUrls{
  final Uri API_POPULAR_MOVIES = Uri.parse(endpoint + "movie/popular?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US&page=1");
  final Uri API_POPULAR_TVSHOWS = Uri.parse(endpoint + "tv/popular?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US&page=1");


  Uri API_ACTOR(String type, String movieId){
    return Uri.parse('$endpoint/$type/$movieId/credits?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US');
  }

  // Uri API_TVSHOW_ACTOR(String tvshowId){
  //   return Uri.parse('$endpoint/tv/$tvshowId/credits?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US');
  // }
      //https://api.themoviedb.org/3/movie/580489/credits?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US
}