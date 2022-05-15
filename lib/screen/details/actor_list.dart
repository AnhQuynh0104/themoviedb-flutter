import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/actor.dart';

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
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Series Cast',
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: FutureBuilder <List<Actor>>(
                      future: ApiServices().fetchActor(widget.type.toString(), widget.id.toString()),
                      builder: (context, snapshot){
                        if((!snapshot.hasData) || (snapshot.hasError)){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<Actor>? actorList = snapshot.data;
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
                            itemCount: actorList!.length,
                            itemBuilder: (BuildContext context, int index){
                              return ActorInfo(
                                  actor: actorList[index]
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class ActorInfo extends StatelessWidget {
  Actor? actor;
  
  ActorInfo({Key? key, this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(
            width: size.width * 0.4,
            height: size.height * 0.4,
            margin: const EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                ),
            ),
            child: Column(
              children: [
                Container(
                  height: size.height / 5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: NetworkImage(image_link + 'w500' + actor!.profile_path.toString()),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding / 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        actor!.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
                        child: Text(
                            actor!.character.toString(),
                          style: const TextStyle(
                            fontSize: 14
                          ),
                        ),
                      ),
                      const Text(
                        '6 Episodes',
                        style: TextStyle(
                            color: Colors.grey,
                          fontSize: 12
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