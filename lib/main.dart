import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/homescreen.dart';
import 'package:themoviedb_app/screen/login/login.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to The Movie App',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: CheckAuth(),
        title: Text('Welcome To The Movie DB',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),
        ),
        image: Image.asset('assets/images/theme.jpg'),
        backgroundColor: Colors.white,
        photoSize: 100.0,
      )
    );
  }
}

class CheckAuth extends StatefulWidget {
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
          } else{
            // future hasnt completed yet
            child = Login();
          }

          return Scaffold(
            body: child,
          );
        }
    );
  }
}