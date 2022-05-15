import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:themoviedb_app/screen/details/detail_screen.dart';


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
            SizedBox(
              width: size.width,
              height: size.height / 2.3,
              child: FutureBuilder <List<Movie>>(
                future: ApiServices().fetchMovie(),
                builder: (context, snapshot){
                  print(snapshot.data);
                  if((!snapshot.hasData)|| (snapshot.hasError)){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<Movie>? movieList = snapshot.data;
                  return ShaderMask(
                      shaderCallback: (Rect rect) {
                        return const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                          stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: movieList!.length,
                          itemBuilder: (BuildContext context, int index){
                            return MovieItem(
                                movie: movieList[index]
                            );
                          }
                      )
                  );
                },
              ),
            )
          ],
        ),
      );
    }
  }



class MovieItem extends StatefulWidget {

  Movie? movie;

  MovieItem({Key? key,
    this.movie,
  }) : super(key: key);

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
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
                    id: widget.movie?.id ?? 0,
                    backdrop_path: image_link + 'original' + widget.movie!.backdrop_path.toString(),
                    poster_path: image_link + 'w200' + widget.movie!.poster_path.toString(),
                    first_air_date: widget.movie!.release_date.toString() ,
                    name: widget.movie!.title.toString(),
                    overview: widget.movie!.overview.toString(),
                    type: 'movie',
                ),
            )
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image_link + 'w200' + widget.movie!.poster_path.toString()),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  widget.movie!.title.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
               widget.movie!.release_date.toString(),
                style: const TextStyle(
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


