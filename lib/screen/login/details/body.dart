import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/build-appbar.dart';
import 'package:themoviedb_app/screen/login/details/button.dart';
import 'package:themoviedb_app/screen/login/details/input.dart';
import 'package:themoviedb_app/screen/login/details/title_and_intro.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding * 1.5,
              horizontal: kDefaultPadding
            ),
            child: Column(
              children: <Widget>[
                  TitleAndIntro(),
                  Input()
              ],
            )
          ),
          Button()
        ],
      ),
    );
  }
}