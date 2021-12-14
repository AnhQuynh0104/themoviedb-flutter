import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/details/detail_screen.dart';

class MovieList extends StatelessWidget {
  const MovieList({
  Key? key,
}) : super(key: key);


@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children:<Widget>[
        MovieItem(
            movieImg: "assets/images/hawkeye.jpg",
            movieName: "Hawyeke",
            date: "Nov 14, 2021"
        ),
        MovieItem(
            movieImg: "assets/images/wheeloffortune.jpg",
            movieName: "Wheel of Fortune",
            date: "Sep 19, 1983"
        ),
        MovieItem(
            movieImg: "assets/images/unfogivable.jpg",
            movieName: "Unforgivable",
            date: "Nov 24, 2021"
        )
      ],
    ),
  );
}
}

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movieImg,
    required this.movieName,
    required this.date,
  }) : super(key: key);

  final String movieImg;
  final String movieName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(),
                )
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(movieImg),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                child: Text(
                  movieName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



