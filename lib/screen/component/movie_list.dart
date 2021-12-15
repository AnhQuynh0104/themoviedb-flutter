import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/data_sources/api_services.dart';
import 'package:themoviedb_app/screen/details/detail_screen.dart';
import 'package:themoviedb_app/screen/models/movie.dart';


class MovieList extends StatefulWidget {
  const MovieList({
    Key? key,
  }) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
    Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:<Widget>[
            Container(
              width: size.width,
              height: size.height / 2,
              child: FutureBuilder <List<Movie>>(
                future: ApiServices().fetchMovie(),
                builder: (context, snapshot){
                  if((!snapshot.hasData)|| (snapshot.hasError)){
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  List<Movie>? movieList = snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index){
                        return MovieItem(
                          movie: movieList![index]
                        );
                      }
                  );
                },
              ),
            )
          ],
        ),
      );
    }
  }



class MovieItem extends StatelessWidget {

  Movie? movie;

  MovieItem({
    this.movie,
  });

  //String type ="";

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
                builder: (context) => DetailScreen(
                    id: movie?.id ?? 0,
                    backdrop_path: image_link + "original" + movie!.backdrop_path.toString(),
                    poster_path: image_link + "w200" + movie!.poster_path.toString(),
                    first_air_date: movie!.release_date.toString() ,
                    name: movie!.title.toString(),
                    overview: movie!.overview.toString(),
                    type: "movie",
                ),
            )
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(image_link + "w200" + movie!.poster_path.toString()),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                child: Text(
                  movie!.title.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
               movie!.release_date.toString(),
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


