import 'package:flutter/material.dart';
import 'package:themoviedb_app/screen/build-appbar.dart';
import 'component/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: const Body(),
    );
  }
}