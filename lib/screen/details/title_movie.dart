import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class TitleMovie extends StatelessWidget {
  const TitleMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: RichText(
        text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: "Thần Tiễn - Hawkeye",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24
                  )
              ),
              TextSpan(
                  text: "  (2021)",
                  style: TextStyle(
                      color: kPrimaryColor
                  )
              )
            ]
        ),
      ),
    );
  }
}

