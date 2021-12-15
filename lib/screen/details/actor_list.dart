import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/data_sources/api_services.dart';
import 'package:themoviedb_app/screen/models/actor.dart';

class ActorList extends StatefulWidget {
  const ActorList({
    Key? key,
    required this.id,
    required this.type
  }) : super(key: key);

  final int id;
  final String type;
  @override
  _ActorListState createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Series Cast",
            style: TextStyle(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: FutureBuilder <List<Actor>>(
                    future: ApiServices().fetchActor(widget.type.toString(), widget.id.toString()),
                    builder: (context, snapshot){
                      if((!snapshot.hasData) || (snapshot.hasError)){
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      List<Actor>? actorList = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: actorList!.length,
                        itemBuilder: (BuildContext context, int index){
                          return ActorInfo(
                              actor: actorList[index]
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

class ActorInfo extends StatelessWidget {
  Actor? actor;
  
  ActorInfo({this.actor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(
            width: size.width * 0.35,
            height: size.height * 0.7,
            margin: EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                ),
            ),
            child: Column(
              children: [
                Image.network(
                  image_link + "w200" + actor!.profile_path.toString(),
                ),
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding / 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        actor!.name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
                        child: Text(
                            actor!.character.toString()
                        ),
                      ),
                      Text(
                        "6 Episodes",
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}