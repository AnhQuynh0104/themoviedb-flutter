import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/data_sources/api_services.dart';
import 'package:themoviedb_app/models/account.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
      backgroundColor: kBackgroundColor,
      body: FutureBuilder<Account>(
        future: ApiServices().getAccount(),
        builder: (context, snapshot){
          if((!snapshot.hasData) || (snapshot.hasError)){
            print('abc: $snapshot.data');
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Account? account = snapshot.data;
          return Container(
            width: size.width,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: <Widget>[
                Text(
                  'My Account',
                  style: GoogleFonts.nunito(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: kBoxColor
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F2088413.jpg&imgrefurl=https%3A%2F%2F'
                          'wallpaperaccess.com%2Ftwice-sana-laptop&tbnid=Z5ynUWTwR_nixM&vet=12ahUKEwihoo_p9-X3AhUUU_UHHShkD1MQMyhLegQIARBw..i&docid=ARb5h'
                          'b84zZKLOM&w=1920&h=1080&q=sana&ved=2ahUKEwihoo_p9-X3AhUUU_UHHShkD1MQMyhLegQIARBw'),
                    )
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    account!.username.toString(),
                    style: GoogleFonts.nunito(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        color: kBoxColor
                    ),
                  ),
                ),
                Text(
                  'Edit Profile',
                  style: GoogleFonts.nunito(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Gender'
                        ),
                        DropdownButton(
                          value: dropdownValue,
                          icon: const ImageIcon(
                              AssetImage('assets/icons/arrow_down.png')
                          ),
                          iconSize: 16.0,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
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
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(value)
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: kDefaultPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Name'
                          ),
                          Container(
                            width: size.width / 1.75,
                            margin: EdgeInsets.only(top: 10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFced4da))
                            ),
                            child: Text(
                                account.name.toString()
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width,
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      'Change password',
                      style: TextStyle(
                          color: kBackgroundColor
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kSplashScreenColor)
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      'Change email',
                      style: TextStyle(
                          color: kBackgroundColor
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kSplashScreenColor)
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
