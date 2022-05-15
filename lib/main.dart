import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/details/check_auth.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to The Movie App',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CheckAuth())
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSplashScreenColor,
        body: Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding * 5),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Movie App',
                  style: GoogleFonts.dancingScript(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: kTitleColor
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/splash_screen.jpg')
                  )
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2,),
              const CircularProgressIndicator(),
              const SizedBox(height: kDefaultPadding * 2,),
              Center(
                child: Text(
                  'from',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                    fontSize: 14,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Nguyễn Quỳnh Anh',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}