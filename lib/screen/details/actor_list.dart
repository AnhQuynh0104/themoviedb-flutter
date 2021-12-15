import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/models/actor.dart';

final Uri API_ACTORS = Uri.parse("https://api.themoviedb.org/3/movie/580489/credits?api_key=f46d76550cd8316769efdd6afe103c5b&language=en-US" );

Future <List<Actor>> fetchActor(){
  return http
      .get(API_ACTORS)
      .then((http.Response response){
    final String jsonBody = response.body;
    int statusCode = response.statusCode;
    if(statusCode != 200 || jsonBody == null){
      print(response.reasonPhrase);
      throw new Exception("Error loaded api actor");
    } else {
      print("Load api actor");
      final JsonDecoder decoder = new JsonDecoder();
      final actorListContainer = decoder.convert(jsonBody);
      final List actorList = actorListContainer['cast'];
      return actorList.map((actorDetail) => new Actor.fromJson(actorDetail)).toList();
    }
  });
}

class ActorList extends StatefulWidget {
  const ActorList({
    Key? key,
    required this.id
  }) : super(key: key);

  final int id;
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
                  child: FutureBuilder <List<Actor>>(
                    future: fetchActor(),
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
            height: size.height * 0.4,
            margin: EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey
                )
            ),
            child: Column(
              children: [
                Image.network(image_link + "w200" + actor!.profile_path.toString()),
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding / 2),
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
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
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

