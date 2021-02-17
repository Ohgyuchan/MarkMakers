import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 20.0, left: 10.0),
              child: IconButton(
                color: Colors.black,
                iconSize: 25.0,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel_outlined),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/profile.jpeg'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: TextFormField(
                autofocus: true,
                initialValue: "오규찬",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
