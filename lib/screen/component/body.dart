import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:themoviedb_app/screen/component/media_discover.dart';
import 'package:themoviedb_app/screen/component/movie_list.dart';
import 'package:themoviedb_app/screen/component/title_with_button.dart';
import 'package:themoviedb_app/screen/component/tvshow_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MediaDiscover(size: size),
          const TitleWithButton(
            title: 'What\'s Popular',
            buttonName: 'On TV',
          ),
          const MovieList(),
          const TitleWithButton(
            title: 'Trending',
            buttonName: 'Today',
          ),
          const TvshowList()
        ],
      ),
    );
  }
}



