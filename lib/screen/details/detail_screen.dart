import 'package:flutter/material.dart';
import 'package:themoviedb_app/screen/build-appbar.dart';
import 'package:themoviedb_app/screen/details/actor.dart';
import 'package:themoviedb_app/screen/details/category.dart';
import 'package:themoviedb_app/screen/details/description.dart';
import 'package:themoviedb_app/screen/details/image_movie.dart';
import 'package:themoviedb_app/screen/details/title_movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageMovie(size: size),
              TitleMovie(),
              Category(),
              Description(),
              Actor(size: size)
            ],
          ),
        )
    );
  }
}

