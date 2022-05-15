import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
          color: kPrimaryColor
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: const <Widget>[
                    Text(
                        'TV-14',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "  .  ",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              const Text(
                  '50 min',
                style: TextStyle(
                    color: Colors.white
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: kDefaultPadding / 2),
            child: Text(
                'Action & Adventure, Phim Chính Kịch',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}