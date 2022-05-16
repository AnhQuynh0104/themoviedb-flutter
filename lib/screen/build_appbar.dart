

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themoviedb_app/constants.dart';

AppBar buildAppbar(Widget leadingIcon, bool isLogin) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    leading: leadingIcon,
    leadingWidth: kDefaultPadding * 2,
    title: SvgPicture.asset(
        'assets/icons/logo.svg',
        fit: BoxFit.cover,
        height: kDefaultPadding * 2,
        color: Colors.white,
      ),
    centerTitle: true,
    actions: <Widget>[
      isLogin ? const LogoutButton() : const SizedBox.shrink()
    ],
  );
}


class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'Do you want to logout?'
                ),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                      },
                      child: const Text('CANCEL')
                  ),
                  TextButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.clear();
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('ACCEPT')
                  )
                ],
              )
          );
        },
        icon: Image.asset('assets/images/login.jpg')
    );
  }
}