import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppbar(
          IconButton(
            icon: Image.asset(
              'assets/icons/back.png',
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
        ), false),
      body: Column(
        children: <Widget>[
          Container(
            height: size.height / 15,
            width: size.width,
            padding: const EdgeInsets.all(12.0),
            color: kSplashScreenColor,
            child: const Text(
              'Search Results',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder <List<Movie>>(
                    future: ApiServices().fetchSearchMovie('a'),
                    builder: (context, snapshot){
                      if((!snapshot.hasData) || (snapshot.hasError)){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Movie>? searchList = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: searchList!.length,
                        itemBuilder: (BuildContext context, int index){
                          return SearchInfo(
                              movie: searchList[index]
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchInfo extends StatelessWidget {
  final Movie? movie;

  const SearchInfo({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: size.height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kBackgroundColor
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 15.0),
           width: size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image_link + 'w200' + movie!.poster_path.toString()),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  movie!.title.toString(),
                  style: const TextStyle(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
              ),
              Text(
                  movie!.release_date.toString(),
                  style: const TextStyle(
                      color: kTitleColor
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
