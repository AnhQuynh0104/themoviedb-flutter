

import 'package:shared_preferences/shared_preferences.dart';
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

  Uri API_SEARCH_MOVIES(String query){
    return Uri.parse('${endpoint}search/movie/$apiKey&language=en-US&query=$query&page=1&include_adult=false');
  }
}

class ApiAccount{
  Future<String?> getAccount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? session = prefs.getString('sessionId');
    return '${endpoint}account$apiKey&session_id=$session';
  }

  Future<String?> getFavorite() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? session = prefs.getString('sessionId');
    int? id = prefs.getInt('accountId');
    return '${endpoint}account/$id/favorite/movies$apiKey&session_id=$session&language=en-US&sort_by=created_at.asc&page=1';
  }

  Future<String?> postFavorite() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? session = prefs.getString('sessionId');
    int? id = prefs.getInt('accountId');
    return '${endpoint}account/$id/favorite$apiKey&session_id=$session';
  }
}
//https://api.themoviedb.org/3/account/11558123/favorite?api_key=f46d76550cd8316769efdd6afe103c5b
// &session_id=c93288098ae396f81b46bc192549d73780fbd2ee