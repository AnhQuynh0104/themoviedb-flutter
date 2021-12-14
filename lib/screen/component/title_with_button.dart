import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
    required this.title,
    required this.buttonName,
  }) : super(key: key);

  final String title, buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding * 1.5
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding ,
                    vertical: kDefaultPadding / 2
                ),
                child: Text(
                  buttonName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

