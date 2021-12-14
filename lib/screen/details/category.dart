import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: kBoxColor
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: <Widget>[
                    Text("TV-14"),
                  ],
                ),
              ),
              Text(
                "  .  ",
              ),
              Text(
                  "50 min"
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding / 2),
            child: Text(
                "Action & Adventure, Phim Chính Kịch"
            ),
          )
        ],
      ),
    );
  }
}