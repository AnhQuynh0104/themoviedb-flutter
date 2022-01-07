import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class LoginErrorScreen extends StatelessWidget {
  const LoginErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        margin: const EdgeInsets.only(bottom: kDefaultPadding),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 0)
            ),
          ],
        ),
        child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(kDefaultPadding),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD40242),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Text(
                          '!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFD40242),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const Text(
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
                padding: const EdgeInsets.only(
                    top: kDefaultPadding,
                    bottom: kDefaultPadding,
                    left: kDefaultPadding * 2 + 10
                ),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Text(
                  'We could not find your username.',
                ),
              )
            ]
        )
    );
  }
}