import 'package:themoviedb_app/constants.dart';

class ApiUrls{
  final Uri API_POPULAR_MOVIES = Uri.parse(endpoint + 'movie/popular' + apiKey + '&language=en-US&page=1');
  final Uri API_POPULAR_TVSHOWS = Uri.parse(endpoint + 'tv/popular' + apiKey + '&language=en-US&page=1');
  final Uri REQUEST_TOKEN = Uri.parse(endpoint + 'authentication/token/new' + apiKey);
  final Uri VALIDATE_WITH_LOGIN = Uri.parse(endpoint + 'authentication/token/validate_with_login' + apiKey);
  final Uri SESSION = Uri.parse(endpoint + 'authentication/session/new' + apiKey);


  Uri API_ACTOR(String type, String movieId){
    return Uri.parse('$endpoint/$type/$movieId/credits$apiKey&language=en-US');
  }
}