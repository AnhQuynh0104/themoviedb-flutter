import 'package:http/http.dart' as http;
import 'package:themoviedb_app/models/actor.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:themoviedb_app/models/request_token.dart';
import 'package:themoviedb_app/models/tvshow.dart';
import 'dart:convert';
import 'dart:convert' as json;
import 'api_urls.dart';

class ApiServices{

  var client = http.Client();

  Future<List<Tvshow>> fetchTvshows(){
    return http
        .get(ApiUrls().API_POPULAR_TVSHOWS)
        .then((http.Response response){
          final String jsonBody = response.body;
          final int statusCode = response.statusCode;
          if(statusCode != 200 || jsonBody == null){
            print(response.reasonPhrase);
            throw new Exception("Error loaded api");
          } else {
            print("Loaded api");
            final JsonDecoder decoder = new JsonDecoder();
            final tvshowListContainer = decoder.convert(jsonBody);
            final List tvshowList = tvshowListContainer['results'];
            return tvshowList.map((tvshowDetail) => new Tvshow.fromJson(tvshowDetail)).toList();
          }
    });
  }

  Future <List<Movie>> fetchMovie(){
    return http
        .get(ApiUrls().API_POPULAR_MOVIES)
        .then((http.Response response){
          final String jsonBody = response.body;
          int statusCode = response.statusCode;
          if(statusCode != 200 || jsonBody == null){
            print(response.reasonPhrase);
            throw new Exception("Error loaded api");
          } else {
            print("Load api");
            final JsonDecoder decoder = new JsonDecoder();
            final movieListContainer = decoder.convert(jsonBody);
            final List movieList = movieListContainer['results'];
            return movieList.map((movieDetail) => new Movie.fromJson(movieDetail)).toList();
          }
    });
  }

  Future <List<Actor>> fetchActor(String type, String id){
    return http
        .get(ApiUrls().API_ACTOR(type, id))
        .then((http.Response response){
      final String jsonBody = response.body;
      int statusCode = response.statusCode;
      if(jsonBody == null || statusCode != 200){
        print("Load actor error");
        throw new Exception(response.reasonPhrase);
      } else {
        final JsonDecoder decoder = new JsonDecoder();
        final actorListContainer = decoder.convert(jsonBody);
        final List actorList = actorListContainer['cast'];
        return actorList.map((actorDetail) => new Actor.fromJson(actorDetail)).toList();
      }
    });
  }

  Future<String> getRequestToken(){
    return http
        .get(ApiUrls().REQUEST_TOKEN)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final JsonDecoder decoder = new JsonDecoder();
      final requestTokenContainer = decoder.convert(jsonBody);
      final String requestToken = requestTokenContainer['request_token'];
      print("get token: " + requestToken);
      return requestToken;
    });
  }

  Future<RequestToken> validateWithLogin(Map<String, dynamic> requestBody) async{
    final response = await http.post(
        ApiUrls().VALIDATE_WITH_LOGIN,
        body: requestBody
    );
    print("validate login: " + response.body);
    return RequestToken.fromJson({"response": response.body});
  }

  Future<String> createSession(Map<String, dynamic> requestBody) async{
    final response = await http.post(
        ApiUrls().SESSION,
        body: requestBody
    );
    print("create session: " + response.body);
    //return response['success'] ? response['session_id'] : null;
    return response.body;
  }
}