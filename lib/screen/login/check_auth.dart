import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb_app/blocs/auth/auth_bloc.dart';
import 'package:themoviedb_app/blocs/auth/auth_state.dart';
import 'package:themoviedb_app/repository/auth_repo.dart';
import 'package:themoviedb_app/screen/homescreen.dart';
import 'package:themoviedb_app/screen/login/login_screen.dart';
import 'package:themoviedb_app/screen/search/favorite.dart';
import 'package:themoviedb_app/screen/search/body.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                  LoginInitial(),
                  AuthRepo()
              )
          )
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const Login(),
            '/home': (context) => const HomeScreen(),
            '/search': (context) => const Search(query: '')
          },
        )
    );
  }
}