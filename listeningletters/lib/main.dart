import 'package:flutter/material.dart';
import 'package:listeningletters/screen/my_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  '듣는편지',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
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
                          style: TextStyle(color: Colors.white, fontSize: 30),
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
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
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
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        onPressed: () {
                          _myScreen(context);
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
      ),
    );
  }

  void _searchScreen() {
    print('searchScreen clicked!');
  }

  void _myScreen(BuildContext context) {
    print('myScreen clicked!');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MyScreen()),
    );
  }
}
