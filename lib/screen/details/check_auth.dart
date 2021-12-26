import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themoviedb_app/screen/homescreen.dart';
import 'package:themoviedb_app/screen/login/login_screen.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  Future<bool>? loginCheckFuture;

  @override
  void initState() {
    super.initState();
    loginCheckFuture = _checkIfLoggedIn();
  }

  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var session = localStorage.getString('sessionId');
    if (session != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    return FutureBuilder(
        future: loginCheckFuture,
        builder: (context, snapshot){
          if(snapshot.hasData){
            if(snapshot.data == true){
              child = HomeScreen();
            } else {
              child = Login();
            }
          } else {
            child = Login();
          }
          return Scaffold(
            body: child,
          );
        }
    );
  }
}