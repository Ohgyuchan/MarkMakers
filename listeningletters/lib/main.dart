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
        primaryColor: Color(0xff212325),
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
                    onPressed: _searchScreen,
                    textColor: Colors.white,
                    color: Color(0xff212325),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  width: 250,
                  height: 150,
                  child: Builder(
                    builder: (context) => RaisedButton(
                      child: Text(
                        '내 스토리',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      onPressed: () {
                        _myScreen(context);
                      },
                      textColor: Colors.white,
                      color: Color(0xff212325),
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
