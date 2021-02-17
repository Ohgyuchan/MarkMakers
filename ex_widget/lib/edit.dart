import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/backg.png'), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 10.0),
            child: IconButton(
              color: Colors.white,
              iconSize: 25.0,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 65.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/backg.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Text(
                    '게시물 올리기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    decoration: InputDecoration(
                      hintText: "제목을 입력해주세요",
                      hintStyle:
                          TextStyle(color: Colors.grey[300], fontSize: 22),
                    ),
                  ),
                ),
                Divider(
                  height: 0.0,
                  color: Colors.white,
                  thickness: 0.5,
                ),
                SizedBox(
                  height: 150.0,
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          iconSize: 100.0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            "assets/microphone.png",
                            width: 100,
                          ),
                        ),
                        Text(
                          '녹음하기',
                          style: TextStyle(
                              color: Color(0xFF2C2F31),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
