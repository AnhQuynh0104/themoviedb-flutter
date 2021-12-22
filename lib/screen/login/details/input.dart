import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {

  final loginController = TextEditingController();

  void dispose(){
    loginController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding / 4),
                    child: Text(
                      "Username",
                    ),
                  ),
                  TextField(
                      controller: loginController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2BC0E8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey ),
                        ),
                      )
                  ),
                ]
            )
        ),
        Padding(
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding / 4),
                    child: Text(
                      "Password",
                    ),
                  ),
                  TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2BC0E8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      )
                  ),
                ]
            )
        ),
      ],
    );;
  }
}
