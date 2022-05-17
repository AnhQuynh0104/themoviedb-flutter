import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';
import 'package:themoviedb_app/screen/details/detail_screen.dart';

class Search extends StatefulWidget {
  const Search({Key? key, required this.query}) : super(key: key);

  final String query;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppbar(
          IconButton(
            icon: Image.asset(
              'assets/icons/back.png',
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
        ), false),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height / 15,
              width: size.width,
              margin: const EdgeInsets.only(bottom: 10.0),
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
                      future: ApiServices().fetchSearchMovie(widget.query.toString()),
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
                            return SearchItem(
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
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  final Movie? movie;

  const SearchItem({Key? key, this.movie}) : super(key: key);

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
