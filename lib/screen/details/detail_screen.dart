import 'package:flutter/material.dart';
import 'package:themoviedb_app/screen/build-appbar.dart';
import 'package:themoviedb_app/screen/details/actor_list.dart';
import 'package:themoviedb_app/screen/details/category.dart';
import 'package:themoviedb_app/screen/details/description.dart';
import 'package:themoviedb_app/screen/details/image_movie.dart';
import 'package:themoviedb_app/screen/details/title_movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.id,
    required this.backdrop_path ,
    required this.poster_path ,
    required this.first_air_date,
    required this.name,
    required this.overview,
  }) : super(key: key);

  final int id;
  final String backdrop_path, poster_path,first_air_date, name, overview;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageMovie(size: size, backdrop_path: backdrop_path, poster_path: poster_path,),
              TitleMovie(name: name),
              Category(),
              Description(overview: overview,),
              ActorList(id: id)
            ],
          ),
        )
    );
  }
}