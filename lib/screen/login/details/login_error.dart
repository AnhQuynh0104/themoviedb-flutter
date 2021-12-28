import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class LoginError extends StatelessWidget {
  const LoginError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: kDefaultPadding),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: Color(0xFFD40242),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                          '!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFD40242),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text(
                        'There was a problem',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.only(
                    top: kDefaultPadding,
                    bottom: kDefaultPadding,
                    left: kDefaultPadding * 2 + 10
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'We could not find your username.',
                ),
              )
            ]
        )
    );
  }
}