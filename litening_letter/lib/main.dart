import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '듣는 편지',
    home: First(),
  ));
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('홈', style: TextStyle(fontSize: 50)),
            color: Colors.white,
            onPressed: () {
              // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return Home();
              }));
            },
          ),
          RaisedButton(
            child: Text('피드', style: TextStyle(fontSize: 50)),
            color: Colors.white,
            onPressed: () {
              // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return Feed();
              }));
            },
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('홈')),
      body: Center(
        child: RaisedButton(
          child: Text('처음 화면으로 돌아가기', style: TextStyle(fontSize: 21)),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);

// 위와 같은 코드
// Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('피드')),
      body: Center(
        child: RaisedButton(
          child: Text('처음 화면으로 돌아가기', style: TextStyle(fontSize: 21)),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);

            // 위와 같은 코드
            // Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
