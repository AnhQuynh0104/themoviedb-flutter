import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:themoviedb_app/screen/models/tvshow.dart';
import 'dart:convert';
import 'dart:convert' as json;
import 'api_urls.dart';

class ApiServices{
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


}