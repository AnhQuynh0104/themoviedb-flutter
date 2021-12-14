import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class Actor extends StatelessWidget {
  const Actor({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

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
                ActorInfo(size: size, actorImg: "assets/images/actor1.jpg", actorName: "Jeremy Jenner", role: "Clint Barton / Hawyeke", ),
                ActorInfo(size: size, actorImg: "assets/images/actor2.jpg", actorName: "Hailee Stanfeil", role: "Kate Bishop",),
                ActorInfo(size: size, actorImg: "assets/images/actor2.jpg", actorName: "Hailee Stanfeil", role: "Kate Bishop",)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActorInfo extends StatelessWidget {
  const ActorInfo({
    Key? key,
    required this.size,
    this.actorImg = "", 
    this.actorName = "", 
    this.role = "",
  }) : super(key: key);

  final Size size;
  final String actorImg, actorName, role;

  @override
  Widget build(BuildContext context) {
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
                Image.asset(actorImg),
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        actorName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                            role
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

