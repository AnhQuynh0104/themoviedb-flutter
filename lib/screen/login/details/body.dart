import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_methods.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/screen/homescreen.dart';
import 'package:themoviedb_app/screen/login/details/title_and_intro.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool enableSignIn = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    usernameController.addListener(() {
      setState(() {
        enableSignIn = usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      });
    });
    passwordController.addListener(() {
      setState(() {
        enableSignIn = usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      });
    });
  }

// import 'package:themoviedb_app/screen/login/details/input.dart';
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding * 1.5, horizontal: kDefaultPadding),
              child: Column(
                children: <Widget>[
                  TitleAndIntro(),
                  Column(
                    children: [
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding / 4),
                              child: Text(
                                "Username",
                              ),
                            ),
                            TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF2BC0E8)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                )),
                          ])),
                      Padding(
                          padding: EdgeInsets.only(top: kDefaultPadding),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: kDefaultPadding / 4),
                                  child: Text(
                                    "Password",
                                  ),
                                ),
                                TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF2BC0E8)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    )
                                ),
                              ]
                          )
                      ),
                    ],
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: TextButton(
              onPressed: () async {
                // 1. lay token
                final token = await ApiServices().getRequestToken();

                // 2. dung token va thong tin user nhap de dang nhap
                final requestToken = await ApiServices().validateWithLogin({
                  'request_token': token,
                  'username': usernameController.text,
                  'password': passwordController.text
                });

                // 3. luu lai token va chuyen den man home
                final session = await ApiServices().createSession({
                  'success': true,
                  'session_id': requestToken
                });

                //enableSignIn ? (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                //} : null;
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF2BC0E8))),
              child: Text(
                "Đăng nhập",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
