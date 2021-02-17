import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20.0, left: 10.0),
            child: IconButton(
              color: Colors.black,
              iconSize: 25.0,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/profile.jpeg'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "오규찬",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff212325)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: 140,
                    height: 5,
                    color: Color(0xff212325),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: () {},
                      child: Container(
                        color: Color(0xff212325),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '프로필 수정하기',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
