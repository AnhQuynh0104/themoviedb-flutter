import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      color: kBackgroundDetail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "This holiday season, the best gifts come with a bow.",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 18
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Text(
              "Overview",
              style: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          Text(
            "Cũng giống như Captain America, Black Widow hay Iron Man, Hawkeye đã rút lui khỏi Avengers. Vì vậy, anh cần có một người kế nhiệm. Ở series Hawkeye, người kế nhiệm của anh chính thức ra mắt khán giả, cô Kate Bishop (Hailee Steinfeld) - một nữ cung thủ được Hawkeye Clint Barton huấn luyện để thay thế mình trong sự nghiệp siêu anh hùng.",
            style: TextStyle(
                fontSize: 18
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: Text(
              "Jonathan Igla",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
          ),
          Text(
              "Creator"
          )
        ],
      ),
    );
  }
}

