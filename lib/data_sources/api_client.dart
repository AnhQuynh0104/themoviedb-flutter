import 'dart:convert';
import 'package:http/http.dart';

class ApiClient{
  final Client client;

  ApiClient(this.client);

   dynamic get(Uri path, {Map<dynamic, dynamic>? params}) async{
    final response = await client.get(
      path,
    );

    if(response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(Uri path, {Map<dynamic, dynamic>? params}) async{
    final response = await client.post(
      path,
      body: jsonEncode(params)
    );

    if(response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}