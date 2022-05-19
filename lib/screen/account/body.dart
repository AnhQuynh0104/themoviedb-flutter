import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/data_sources/api_urls.dart';
import 'package:themoviedb_app/models/account.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  Future<Null> getSharedPrefs() async {
    var accountId = await ApiServices().getAccountId();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('accountId', accountId);
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dropdownValue = 'Female';

    return Scaffold(
      appBar: buildAppbar(
          IconButton(
            icon: Image.asset(
              'assets/icons/back.png',
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
          ),
          false
      ),
      backgroundColor: kSplashScreenColor,
      body: FutureBuilder<Account>(
        future: ApiServices().getAccount(),
        builder: (context, snapshot){
          if((!snapshot.hasData) || (snapshot.hasError)){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Account? account = snapshot.data;

          return Container(
            width: size.width,
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Column(
              children: <Widget>[
                Text(
                  'My Account',
                  style: GoogleFonts.nunito(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image(
                      width: 200,
                      height: 200,
                      image: NetworkImage(image_link + 'w200' + account!.avatar!.tmdb!.avatarPath.toString()),
                    )
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    account!.username.toString(),
                    style: GoogleFonts.nunito(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        color: kBackgroundColor
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: Text(
                    'Edit Profile',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 24,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                            'Gender',
                          style: TextStyle(
                            color: kBackgroundColor
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding / 2,),
                        Expanded(
                          child: DropdownButton(
                            elevation: 16,
                            isExpanded: true,
                            value: dropdownValue,
                            icon: const ImageIcon(
                                AssetImage('assets/icons/arrow_down.png')
                            ),
                            iconSize: 16.0,
                            dropdownColor: kPrimaryColor,
                            iconEnabledColor: kBackgroundColor,
                            style: const TextStyle(color: kBackgroundColor),
                            underline: Container(
                              height: 2,
                              color: kPrimaryColor,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Female', 'Male', 'Other']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(value)
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                            'Name',
                          style: TextStyle(
                            color: kBackgroundColor
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding / 2,),
                        Expanded(
                          child: Container(
                            //width: size.width / 1.35,
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                left: 7.0
                            ),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: kPrimaryColor,
                                    width: 2.0
                                )
                            ),
                            child: Text(
                                account.name.toString(),
                              style: const TextStyle(
                                color: kBackgroundColor
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                  width: size.width,
                  child: TextButton(
                    onPressed: (){},
                    child: const Text(
                      'Change password',
                      style: TextStyle(
                          color: kBackgroundColor
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPrimaryColor)
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(top: kDefaultPadding / 3),
                  child: TextButton(
                    onPressed: (){},
                    child: const Text(
                      'Change email',
                      style: TextStyle(
                          color: kBackgroundColor
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPrimaryColor)
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
