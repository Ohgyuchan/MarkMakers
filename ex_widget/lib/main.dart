// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart=2.9

// 2C2F31 and FFFFFF

//import 'package:firebase_auth/firebase_auth.dart'; // Only needed if you configure the Auth Emulator below
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'register_page.dart';
import 'signin_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Uncomment this to use the auth emulator for testing
  // await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  runApp(MyApp());
}

/// The entry point of the application.
///
/// Returns a [MaterialApp].
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listening Letters',
      theme: ThemeData.light(),
      home: Scaffold(
        body: AuthTypeSelector(),
      ),
    );
  }
}

/// Provides a UI to select a authentication type page
class AuthTypeSelector extends StatelessWidget {
  // Navigates to a new page
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Firebase Example App'),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment(0, 0.5),
            height: 250,
            decoration: BoxDecoration(
              color: Color(0xFF2C2F31),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Container(
              child: Image.asset('assets/letter.png'),
            ),
            // child: Text(
            //   '듣는 편지',
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 30,
            //       fontWeight: FontWeight.bold),
            // ),
          ),
          Expanded(
              child: Container(
            color: Color(0xFF2C2F31),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(75),
                  bottomRight: Radius.circular(75),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                  ),
                  Container(
                    width: 300,
                    height: 130,
                    child: RaisedButton(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Color(0xFF2C2F31),
                      child: Text(
                        '로그인',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                      onPressed: () => _pushPage(context, SignInPage()),
                    ),
                  ),
                  Container(
                    height: 60,
                  ),
                  Container(
                    width: 300,
                    height: 130,
                    child: RaisedButton(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Color(0xFF2C2F31),
                      child: Text(
                        '회원가입',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                      onPressed: () => _pushPage(context, RegisterPage()),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
