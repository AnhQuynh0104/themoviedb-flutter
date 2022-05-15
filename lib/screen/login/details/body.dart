import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb_app/blocs/auth/auth_bloc.dart';
import 'package:themoviedb_app/blocs/auth/auth_event.dart';
import 'package:themoviedb_app/blocs/auth/auth_state.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/login/details/title_and_intro.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isUsernameBlank = false;
  bool isPasswordBlank = false;

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

  void onPressLoginButton() async {
    authBloc!.add(
        LoginButtonPressed(
            username: usernameController.text,
            password: passwordController.text
        )
    );
    setState(() {
      usernameController.text.isEmpty ? isUsernameBlank = true : isUsernameBlank = false;
      passwordController.text.isEmpty ? isPasswordBlank = true : isPasswordBlank = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    final errorMessage = BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state){
          if(state is LoginFailed){
            return Text(
                state.message,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),
            );
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
                              style: TextStyle(
                                  color: Color(0xFF000000)
                              ),
                            ),
                          ),
                          TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                errorText: isUsernameBlank ? 'Username Can\'t Be Empty' : null,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: kBoxColor),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF000000)),
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
                                  style: TextStyle(
                                      color: Color(0xFF000000)
                                  ),
                                ),
                              ),
                              TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    errorText: isPasswordBlank ? 'Password Can\'t Be Empty' : null,
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kBoxColor
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF000000)),
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
            onPressed: onPressLoginButton,
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(kBoxColor)
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
