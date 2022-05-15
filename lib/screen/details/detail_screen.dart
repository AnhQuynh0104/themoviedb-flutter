import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/bottom-nav.dart';
import 'package:themoviedb_app/screen/build-appbar.dart';
import 'package:themoviedb_app/screen/details/actor_list.dart';
import 'package:themoviedb_app/screen/details/category.dart';
import 'package:themoviedb_app/screen/details/description.dart';
import 'package:themoviedb_app/screen/details/image_movie.dart';
import 'package:themoviedb_app/screen/details/title_movie.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.id,
    required this.backdrop_path,
    required this.poster_path,
    required this.first_air_date,
    required this.name,
    required this.overview,
    required this.type
  }) : super(key: key);

  final int id;
  final String backdrop_path, poster_path,first_air_date, name, overview, type;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppbar(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'List'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Mark'
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.amber[800],
        ),
        backgroundColor: kBoxColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageMovie(size: size, backdrop_path: widget.backdrop_path, poster_path: widget.poster_path,),
              TitleMovie(name: widget.name),
              const Category(),
              Description(overview: widget.overview,),
              ActorList(id: widget.id, type: widget.type,),
            ],
          ),
        )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}


// class DetailScreen extends StatelessWidget {
//   const DetailScreen({
//     Key? key,
//     required this.id,
//     required this.backdrop_path ,
//     required this.poster_path ,
//     required this.first_air_date,
//     required this.name,
//     required this.overview,
//     required this.type,
//   }) : super(key: key);
//
//   final int id;
//   final String backdrop_path, poster_path,first_air_date, name, overview, type;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     int _selectedIndex = 0;
//     void _onItemTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//     return Scaffold(
//         appBar: buildAppbar(),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.list),
//                 label: 'List'
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite),
//                 label: 'Favorite'
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.bookmark),
//                 label: 'Mark'
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//         ),
//         backgroundColor: kBoxColor,
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               ImageMovie(size: size, backdrop_path: backdrop_path, poster_path: poster_path,),
//               TitleMovie(name: name),
//               const Category(),
//               Description(overview: overview,),
//               ActorList(id: id, type: type,),
//             ],
//           ),
//         )
//     );
//   }
// }