import 'package:themoviedb_app/constants.dart';

class ApiUrls{
  final Uri API_POPULAR_MOVIES = Uri.parse(endpoint + "movie/popular?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US&page=1");
  final Uri API_POPULAR_TVSHOWS = Uri.parse(endpoint + "tv/popular?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US&page=1");
  final Uri REQUEST_TOKEN = Uri.parse(endpoint + "authentication/token/new?api_key=f46d76550cd8316769efdd6afe103c5b");
  final Uri VALIDATE_WITH_LOGIN = Uri.parse(endpoint + "authentication/token/validate_with_login?api_key=f46d76550cd8316769efdd6afe103c5b");
  final Uri SESSION = Uri.parse(endpoint + "authentication/session/new?api_key=f46d76550cd8316769efdd6afe103c5b");


  Uri API_ACTOR(String type, String movieId){
    return Uri.parse('$endpoint/$type/$movieId/credits?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US');
  }
}