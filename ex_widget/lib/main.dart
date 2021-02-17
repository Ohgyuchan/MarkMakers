import 'package:flutter/material.dart';
import 'myhome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                    image: AssetImage('assets/backg2.png'), fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Center(child: Image.asset('assets/letter.png')),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 150, 0, 50),
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
