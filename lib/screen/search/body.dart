import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';
import 'package:themoviedb_app/screen/details/detail_screen.dart';
import 'package:themoviedb_app/screen/search/history.dart';
import 'package:themoviedb_app/screen/search/item.dart';

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
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => History(name: widget.query.toString()))
                );
              },
              child: const Text(
                    'View search history...'
                  )
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: size.width,
                    height: size.height,
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
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchList!.length,
                          itemBuilder: (BuildContext context, int index){
                            return Item(
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


