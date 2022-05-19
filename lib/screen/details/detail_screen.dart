import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';
import 'package:themoviedb_app/screen/details/actor_list.dart';
import 'package:themoviedb_app/screen/details/category.dart';
import 'package:themoviedb_app/screen/details/description.dart';
import 'package:themoviedb_app/screen/details/image_movie.dart';
import 'package:themoviedb_app/screen/details/title_movie.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.id,
    required this.backdrop_path,
    required this.poster_path,
    required this.first_air_date,
    required this.name,
    required this.overview,
    required this.type
  }) : super(key: key);

  final int id;
  final String backdrop_path, poster_path,first_air_date, name, overview, type;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  final GlobalKey _toolTipKey1 = GlobalKey();
  final GlobalKey _toolTipKey2 = GlobalKey();
  bool isOnTap1 = true;
  bool isOnTap2 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppbar(
          IconButton(
            icon: Image.asset(
                'assets/icons/back.png',
                color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
          ),
          false
        ),
        backgroundColor: kBoxColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ApiServices().postFavoriteMovie({
              'media_type': "movie",
              'media_id': 550,
              'favorite': true
            });
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Message'),
                content: const Text('Add favorite movie successful !'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'))
                ],
              ),
            );
          },
          backgroundColor: Colors.red,
          child: const ImageIcon(
              AssetImage("assets/icons/favorite.png"),
              color: kBackgroundColor,
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageMovie(size: size, backdrop_path: widget.backdrop_path, poster_path: widget.poster_path,),
              TitleMovie(name: widget.name),
              const Category(),
              Description(overview: widget.overview,),
              ActorList(id: widget.id, type: widget.type,),
            ],
          ),
        )
    );
  }
}