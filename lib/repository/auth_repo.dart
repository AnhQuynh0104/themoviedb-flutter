import 'package:themoviedb_app/data_sources/api_services.dart';

class AuthRepo{
  login(String username, String password) async{

    // 1. lay token
    final token = await ApiServices().getRequestToken();

    // 2. dung token va thong tin user nhap de dang nhap
    final requestToken = await ApiServices().validateWithLogin({
      'request_token': token,
      'username': username,
      'password': password
    });

    // 3. luu lai token va chuyen den man home
    final session = await ApiServices().createSession({
      'request_token': token
    });

    return session;

  }
}