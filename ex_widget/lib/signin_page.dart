// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart=2.9

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'validators.dart';
import 'home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

/// Entrypoint example for various sign-in flows with Firebase.
class SignInPage extends StatefulWidget {
  /// The page title.
  final String title = 'Sign In & Out';

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2F31),
      body: Builder(
        builder: (ctx) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 60.0, left: 10.0),
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    color: Colors.black,
                    iconSize: 25.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      semanticLabel: '뒤로가기',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Image.asset('assets/login.png'),
                ),
                Container(
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C2F31),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '이메일',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.black,
                            ),
                            validator: emailValidator,
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '비밀번호',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.black,
                            ),
                            validator: passwordValidator,
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 50,
                          child: RaisedButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Color(0xFF2C2F31),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                 await _signInWithEmailAndPassword(ctx);
                              }
                            },
                            child: Text(
                              '로그인',
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 30,
                          child: TextButton.icon(
                            label: Text('구글로그인'),
                            icon: Icon(Icons.android),
                            onPressed: () async {
                              await _googleSignin(ctx);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Example code for sign out.
  // Future<void> _signOut() async {
  //   await _auth.signOut();
  // }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code of how to sign in with email and password.
  Future<void> _signInWithEmailAndPassword(BuildContext ctx) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text('${user.email} 성공적으로 로그인이 되었습니다!'),
        ),
      );
      Navigator.pop(context);
      _pushPage(context, MyApp());
    } catch (e) {
      Scaffold.of(ctx).showSnackBar(
        const SnackBar(
          content: Text('로그인에 실패했습니다! 이메일 또는 비밀번호를 확인해주세요!'),
        ),
      );
    }
  }

  Future<void> _googleSignin(BuildContext context) async {
    try {
      GoogleSignInAccount account = await googleSignIn.signIn();
      GoogleSignInAuthentication authentication = await account.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken );

      UserCredential authResult = await _auth.signInWithCredential(credential);
      User user = authResult.user;
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('${user.email} 성공적으로 로그인이 되었습니다!'),
        ),
      );
      Navigator.pop(context);
      _pushPage(context, MyApp());
    }
    catch (e) {
      Scaffold.of(context).showSnackBar(
        const SnackBar(
          content: Text('로그인에 실패했습니다! 구글계정을 확인해주세요!'),
        ),
      );
    }
  }
}
