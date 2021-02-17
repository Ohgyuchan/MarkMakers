import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'myhome.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listening Letters',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF2C2F31),
        accentColor: Colors.white,
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/backg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 60.0, left: 10.0),
                      color: Color(0xFF2C2F31),
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 25.0,
                        onPressed: () {
                          _signOut();
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          semanticLabel: '로그아웃',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 60.0),
                      color: Color(0xFF2C2F31),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '로그아웃',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(child: Image.asset('assets/letter.png')),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 130, 0, 50),
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Builder(
                          builder: (context) => FloatingActionButton.extended(
                            heroTag: "search_btn",
                            tooltip: '검색!',
                            backgroundColor: Color(0xFF2C2F31),
                            label: Text(
                              '검 색',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            onPressed: () {
                              _searchScreen();
                            },
                            // textColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 60, 0, 50),
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Builder(
                          builder: (context) => FloatingActionButton.extended(
                            heroTag: "my_btn",
                            tooltip: '내 스토리!',
                            backgroundColor: Color(0xFF2C2F31),
                            label: Text(
                              '내 스토리',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirestoreFirstDemo()),
                              );
                            },
                            // textColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _searchScreen() {
    print('searchScreen clicked!');
  }
}
