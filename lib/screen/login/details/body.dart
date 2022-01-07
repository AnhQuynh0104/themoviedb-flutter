import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themoviedb_app/blocs/auth/auth_bloc.dart';
import 'package:themoviedb_app/blocs/auth/auth_event.dart';
import 'package:themoviedb_app/blocs/auth/auth_state.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/login/details/login_error_screen.dart';
import 'package:themoviedb_app/screen/login/details/title_and_intro.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  AuthBloc? authBloc;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final errorMessage = BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state){
          if(state is LoginFailed){
            return const LoginErrorScreen();
          } else if(state is LoginLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        }
    );

    final loginForm = Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 1.5, horizontal: kDefaultPadding),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(
                                bottom: kDefaultPadding / 4),
                            child: Text(
                              'Username',
                            ),
                          ),
                          TextField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFF2BC0E8)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )
                          ),
                        ]
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: kDefaultPadding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(
                                    bottom: kDefaultPadding / 4),
                                child: Text(
                                  'Password',
                                ),
                              ),
                              TextField(
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF2BC0E8)
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                  )
                              ),
                            ]
                        )
                    ),
                  ],
                )
              ],
            )
        ),
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          child: TextButton(
            onPressed: () async {
              authBloc!.add(LoginButtonPressed(username: usernameController.text, password: passwordController.text));
              final prefs = await SharedPreferences.getInstance();
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(const Color(0xFF2BC0E8))
            ),
            child: const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
        ),
      ],
    );

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if(state is LoginSuccess){
            Navigator.pushNamed(context, '/home');
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: kDefaultPadding * 3),
          child: Column(
            children: [
                const TitleAndIntro(),
                errorMessage,
                loginForm
            ],
          ),
        )

    );
  }
}
