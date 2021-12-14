import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/build-appbar.dart';
import 'package:themoviedb_app/screen/details/category.dart';
import 'package:themoviedb_app/screen/details/title_movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: size.height / 5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/hawyeke_bg.jpg"),
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
                                image: AssetImage("assets/images/hawkeye.jpg")
                            ),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      )
                  )
                ],
              ),
              TitleMovie(),
              Category()
            ],
          ),
        )
    );
  }
}
