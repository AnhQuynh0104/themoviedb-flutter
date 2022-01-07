import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.overview,
  }) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      color: kBackgroundDetail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'This holiday season, the best gifts come with a bow.',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 18
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Text(
              'Overview',
              style: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          Text(
            overview,
            style: const TextStyle(
                fontSize: 18
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: Text(
              'Jonathan Igla',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
          ),
          const Text(
              'Creator'
          )
        ],
      ),
    );
  }
}

