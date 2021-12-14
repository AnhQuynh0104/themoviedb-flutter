import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class MediaDiscover extends StatelessWidget {
  const MediaDiscover({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height / 3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://www.themoviedb.org/t/p/w880_and_h600_multi_faces_filter(duotone,032541,01b4e4)/8bcoRX3hQRHufLPSDREdvr3YMXx.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Welcome",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50
              ),
            ),
            Text(
                "Millions of movies, TV shows and people to discover. Explore now.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
            )
          ],
        ),
      ),
    );
  }
}
