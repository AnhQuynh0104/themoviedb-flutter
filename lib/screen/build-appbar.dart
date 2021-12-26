import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/login/login_screen.dart';


AppBar buildAppbar() {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/menu.svg',
        color: Colors.white,
      ),
    ),
    leadingWidth: kDefaultPadding * 2,
    title: SvgPicture.asset(
        'assets/icons/logo.svg',
        fit: BoxFit.cover,
        height: kDefaultPadding * 2,
        color: Colors.white,
      ),
    centerTitle: true,
    actions: <Widget>[
      LogoutButton()
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
                title: Text(
                  'Do you want to logout?'
                ),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                      },
                      child: Text('CANCEL')
                  ),
                  TextButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.clear();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Login()
                            )
                        );
                      },
                      child: Text('ACCEPT')
                  )
                ],
              )
          );
        },
        icon: Image.asset('assets/images/login.jpg')
    );
  }
}