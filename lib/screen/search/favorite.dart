import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/movie.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';
import 'package:themoviedb_app/screen/search/item.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  buildAppbar(
          IconButton(
            icon: Image.asset(
              'assets/icons/back.png',
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
          ), false
      ),
      backgroundColor: kBackgroundColor,
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
                'My Favorite',
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
                    width: size.width,
                    height: size.height,
                    child: FutureBuilder <List<Movie>>(
                      future: ApiServices().fetchFavoriteMovie(),
                      builder: (context, snapshot){
                        if((!snapshot.hasData) || (snapshot.hasError)){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<Movie>? favoriteList = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: favoriteList!.length,
                          itemBuilder: (BuildContext context, int index){
                            return Item(
                                movie: favoriteList[index]
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
