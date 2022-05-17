import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';
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

  final GlobalKey _toolTipKey1 = GlobalKey();
  final GlobalKey _toolTipKey2 = GlobalKey();
  bool isOnTap1 = true;
  bool isOnTap2 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppbar(
          IconButton(
            icon: Image.asset(
                'assets/icons/back.png',
                color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
          ),
          false
        ),
        backgroundColor: kBoxColor,
        bottomNavigationBar: Container(
          height: size.height / 15,
          color: kPrimaryColor,
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    isOnTap1 = !isOnTap1;
                    setState(() {

                    });
                    final dynamic _toolTip = _toolTipKey1.currentState;
                    _toolTip.ensureTooltipVisible();
                  },
                  child: Tooltip(
                      key: _toolTipKey1,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(bottom: 5.0),
                    message: "Add to watch list",
                    child: ImageIcon(
                        const AssetImage("assets/icons/mark.png"),
                        color: isOnTap1 ? Colors.white : Colors.yellow,
                      )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    isOnTap2 = !isOnTap2;
                    setState(() {

                    });
                    final dynamic _toolTip = _toolTipKey2.currentState;
                    _toolTip.ensureTooltipVisible();
                  },
                  child: Tooltip(
                      key: _toolTipKey2,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(bottom: 5.0),
                      message: "Mark as favorite",
                      child: ImageIcon(
                        const AssetImage("assets/icons/favorite.png"),
                        color: isOnTap2 ? Colors.white : Colors.red,
                      )
                  ),
                ),
              ),
            ],
          )
        ),
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
}