import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/details/check_auth.dart';
import 'package:themoviedb_app/screen/login/login_screen.dart';
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
        title: Text('WELCOME TO TMDB',
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