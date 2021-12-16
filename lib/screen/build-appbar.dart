import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/login/login.dart';


AppBar buildAppbar() {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        "assets/icons/menu.svg",
        color: Colors.white,
      ),
    ),
    leadingWidth: kDefaultPadding * 2,
    title: SvgPicture.asset(
        "assets/icons/logo.svg",
        fit: BoxFit.cover,
        height: kDefaultPadding * 2,
        color: Colors.white,
      ),
    centerTitle: true,
    actions: <Widget>[
      LoginButton()
    ],
  );
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Login()
                )
            );
          },
          icon: Image.asset("assets/images/login.jpg")
      ),
    );
  }
}