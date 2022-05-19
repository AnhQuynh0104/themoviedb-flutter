import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/account/body.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';
import 'package:themoviedb_app/screen/search/favorite.dart';
import 'component/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(const MenuButton(), true),
      body: const Body(),
    );
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          fit: BoxFit.cover,
          height: kDefaultPadding * 2,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10.0),
        onSelected: (value){
          if(value == 1){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyAccount())
            );
          }
          if(value == 2){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorite())
            );
          }
        },
        itemBuilder: (context) => const[
          PopupMenuItem(
            child: Text("My Account"),
            value: 1,
          ),
          PopupMenuItem(
            child: Text("My Favorite"),
            value: 2,
          ),
        ]
    );
  }
}
