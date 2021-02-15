import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listening Letters',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('듣는 편지'),
        ),
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
                  width: 250,
                  height: 150,
                  child: RaisedButton(
                    child: Text(
                      '검 색',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    onPressed: searchScreen,
                    textColor: Colors.white,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  width: 250,
                  height: 150,
                  child: RaisedButton(
                    child: Text(
                      '내 스토리',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    onPressed: myScreen,
                    textColor: Colors.white,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void searchScreen() {
    print('searchScreen clicked!');
  }

  void myScreen() {
    print('myScreen clicked!');
  }
}
