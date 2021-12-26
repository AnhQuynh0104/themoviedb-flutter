import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class TitleAndIntro extends StatelessWidget {
  const TitleAndIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Login to your account',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. ',
          ),
        ),
      ],
    );
  }
}