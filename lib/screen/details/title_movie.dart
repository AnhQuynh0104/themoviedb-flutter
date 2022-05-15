import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class TitleMovie extends StatelessWidget {
  const TitleMovie({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: RichText(
        text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24
                  )
              ),
              const TextSpan(
                  text: '  (2021)',
                  style: TextStyle(
                      color: Colors.white
                  )
              )
            ]
        ),
      ),
    );
  }
}