import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPost',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/backg2.png'), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 65.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/cuty.png'),
                    radius: 40.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    '박규경',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: SizedBox(
                    width: 500,
                    height: 60,
                    child: FloatingActionButton.extended(
                      heroTag: 'contact',
                      // onPressed: () {
                      //   Navigator.push(
                      //       context,
                      //       CupertinoPageRoute(
                      //           builder: (context) => EditPage()));
                      // },
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => FirestoreFirstDemo();),
                        // );
                      },
                      tooltip: 'aaa',
                      backgroundColor: Colors.white,
                      label: Text('게시물 추가',
                          style:
                              TextStyle(color: Colors.black, fontSize: 22.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 550,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[...LoadPost()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> LoadPost() {
    List<Widget> postList = [];
    postList.add(
      Container(
        margin: EdgeInsets.only(bottom: 15),
        child: SizedBox(
          width: 500,
          height: 60,
          child: FloatingActionButton.extended(
            heroTag: 'post1',
            onPressed: () {
              // Navigator.push(
              //   // context,
              //   CupertinoPageRoute(
              //     builder: (context) => EditPage2()));
            },
            tooltip: 'aaa',
            backgroundColor: MyColors.dark,
            label: Text('오늘의 일상',
                style: TextStyle(color: Colors.white, fontSize: 22.0)),
          ),
        ),
      ),
    );
    postList.add(
      Container(
        margin: EdgeInsets.only(bottom: 15),
        child: SizedBox(
          width: 500,
          height: 60,
          child: FloatingActionButton.extended(
            heroTag: 'post2',
            onPressed: () {
              // Navigator.push(
              //   // context,
              //   CupertinoPageRoute(
              //     builder: (context) => EditPage2()));
            },
            tooltip: 'aaa',
            backgroundColor: MyColors.dark,
            label: Text('강아지랑 놀았다',
                style: TextStyle(color: Colors.white, fontSize: 22.0)),
          ),
        ),
      ),
    );
    postList.add(
      Container(
        margin: EdgeInsets.only(bottom: 15),
        child: SizedBox(
          width: 500,
          height: 60,
          child: FloatingActionButton.extended(
            heroTag: 'post',
            onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => FirestoreFirstDemo()),
              //   );
            },
            tooltip: 'aaa',
            backgroundColor: MyColors.dark,
            label: Text('미스터피자 맛있음',
                style: TextStyle(color: Colors.white, fontSize: 22.0)),
          ),
        ),
      ),
    );
    return postList;
  }
}

class MyColors {
  static const MaterialColor dark = MaterialColor(
    0xFF2C2F31,
    <int, Color>{
      50: Color(0xFF2C2F31),
      100: Color(0xFF2C2F31),
      200: Color(0xFF2C2F31),
      300: Color(0xFF2C2F31),
      400: Color(0xFF2C2F31),
      500: Color(0xFF2C2F31),
      600: Color(0xFF2C2F31),
      700: Color(0xFF2C2F31),
      800: Color(0xFF2C2F31),
      900: Color(0xFF2C2F31),
    },
  );
}
