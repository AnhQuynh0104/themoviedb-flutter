import 'package:flutter/material.dart';
import 'package:themoviedb_app/constants.dart';
import 'package:themoviedb_app/screen/build_appbar.dart';
import 'package:themoviedb_app/sqlite_helper/helper.dart';

class History extends StatefulWidget {
  const History({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, dynamic>> list = [];

  void _getList() async{
    final data = await SQLHelper.getItems();
    setState((){
      list = data;
    });
  }

   void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Message'),
          content: const Text('Deleted successful!'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        )
    );
    _getList();
  }

  @override
  void initState(){
    super.initState();
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
          ), false),
      body: Column(
        children: [
          Container(
            height: size.height / 15,
            width: size.width,
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.all(12.0),
            color: kSplashScreenColor,
            child: const Text(
              'Search History',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    list[index]['name']
                ),
                trailing: IconButton(
                  icon: Image.asset(
                      'assets/icons/close.png',
                    width: 16.0,
                  ),
                  onPressed: () => deleteItem(list[index]['id']),
                ),
              ),
            ),
          )
          ],
        )
      );
    }
}
