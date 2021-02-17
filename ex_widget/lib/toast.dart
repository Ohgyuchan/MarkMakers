/*
  https://github.com/fkkmemi/ff2/blob/master/lib/methods/toast.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

toastError(GlobalKey<ScaffoldState> key, dynamic e) {
  String message = 'unknown error';
  if (e is PlatformException) message = e.message;
  else if (e is String) message = e;
  final snackBar = SnackBar(content: Text(message));
  key.currentState.showSnackBar(snackBar);  
}