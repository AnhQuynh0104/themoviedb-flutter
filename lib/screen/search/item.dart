import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:themoviedb_app/screen/details/detail_screen.dart';


class Item extends StatelessWidget {
  final Movie? movie;

  const Item({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  id: movie?.id ?? 0,
                  backdrop_path: image_link + 'original' + movie!.backdrop_path.toString(),
                  poster_path: image_link + 'w200' + movie!.poster_path.toString(),
                  first_air_date: movie!.release_date.toString() ,
                  name: movie!.title.toString(),
                  overview: movie!.overview.toString(),
                  type: 'movie',
                ),
              )
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.only(right: kDefaultPadding / 2.5),
          height: size.height / 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kSplashScreenColor
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 15.0),
                width: size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image_link + 'w200' + movie!.poster_path.toString()),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        movie!.title.toString(),
                        style: const TextStyle(
                            color: kBackgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      movie!.release_date.toString(),
                      style: const TextStyle(
                          color: kBackgroundColor
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
