import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:themoviedb_app/models/account.dart';
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
            throw Exception('Error loaded api tvshow');
          } else {
            print('Load api tvshow');
            final JsonDecoder decoder = JsonDecoder();
            final tvshowListContainer = decoder.convert(jsonBody);
            final List tvshowList = tvshowListContainer['results'];
            return tvshowList.map((tvshowDetail) => Tvshow.fromJson(tvshowDetail)).toList();
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
            throw Exception('Error loaded api movie');
          } else {
            print('Load api movie');
            final JsonDecoder decoder = JsonDecoder();
            final movieListContainer = decoder.convert(jsonBody);
            final List movieList = movieListContainer['results'];
            return movieList.map((movieDetail) => Movie.fromJson(movieDetail)).toList();
          }
    });
  }

  Future <List<Movie>> fetchSearchMovie(String query){
    return http
        .get(ApiUrls().API_SEARCH_MOVIES(query))
        .then((http.Response response){
      final String jsonBody = response.body;
      int statusCode = response.statusCode;
      if(statusCode != 200 || jsonBody == null){
        print(response.reasonPhrase);
        throw Exception('Error loaded api search');
      } else {
        print('Load api search');
        final JsonDecoder decoder = JsonDecoder();
        final movieListContainer = decoder.convert(jsonBody);
        final List movieList = movieListContainer['results'];
        return movieList.map((movieDetail) => Movie.fromJson(movieDetail)).toList();
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
        print('Error loaded api actor');
        throw Exception(response.reasonPhrase);
      } else {
        final JsonDecoder decoder = JsonDecoder();
        final actorListContainer = decoder.convert(jsonBody);
        final List actorList = actorListContainer['cast'];
        return actorList.map((actorDetail) => Actor.fromJson(actorDetail)).toList();
      }
    });
  }

  Future<String> getRequestToken(){
    return http
        .get(ApiUrls().REQUEST_TOKEN)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final JsonDecoder decoder = JsonDecoder();
      final requestTokenContainer = decoder.convert(jsonBody);
      final String requestToken = requestTokenContainer['request_token'];
      print('get token: ' + requestToken);
      return requestToken;
    });
  }

  Future<RequestToken> validateWithLogin(Map<String, dynamic> requestBody) async{
    final response = await http.post(
        ApiUrls().VALIDATE_WITH_LOGIN,
        body: requestBody
    );
    print('validate login: ' + response.body);
    return RequestToken.fromJson({'response': response.body});
  }

  Future<Map<String, dynamic>> createSession(Map<String, dynamic> requestBody) async{
    final response = await http.post(
        ApiUrls().SESSION,
        body: requestBody
    );
    print('create session: ' + response.body);
    return jsonDecode(response.body);
  }

  Future<Account> getAccount(){
    return http
        .get(Uri.parse(ApiAccount().getAccount().toString()))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final JsonDecoder decoder = JsonDecoder();
      final accountContainer = decoder.convert(jsonBody);
      print('get account: ' + accountContainer);
      return accountContainer;
    });
  }
}