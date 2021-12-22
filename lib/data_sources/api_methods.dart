
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:themoviedb_app/data_sources/api_urls.dart';
import 'package:themoviedb_app/models/request_token.dart';

class ApiMethods{

  var client = http.Client();

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