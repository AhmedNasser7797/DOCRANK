import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final1/auth.dart';
import 'SignIn.dart';
import 'root.dart';

void main() {
  runApp(new MaterialApp(
    title: "start",
    home: RootPage(auth: new Auth(),
    ),
  ));
}
