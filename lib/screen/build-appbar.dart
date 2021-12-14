import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themoviedb_app/constants.dart';

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
      IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/login.jpg")
      )
    ],
  );
}
