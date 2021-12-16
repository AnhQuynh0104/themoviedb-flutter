import 'package:flutter/material.dart';
import 'package:themoviedb_app/screen/build-appbar.dart';
import 'package:themoviedb_app/screen/login/details/body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Body(),
    );
  }
}
