import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class ImageMovie extends StatelessWidget {
  const ImageMovie({
    Key? key,
    required this.size,
    this.backdrop_path = "",
    this.poster_path = "",
  }) : super(key: key);

  final Size size;
  final String backdrop_path, poster_path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: size.height / 5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(backdrop_path),
                  fit: BoxFit.cover
              )
          ),
        ),
        Positioned(
            top: 12,
            left: 5,
            child: Container(
              width: size.width / 4,
              height: size.height / 6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(poster_path)
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
            )
        )
      ],
    );
  }
}
