import 'dart:io';

import 'package:final1/SignIn.dart';
import 'package:final1/loading.dart';
import 'package:final1/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _errorText = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _submit() async {
    if (_emailController.text.length < 3 ||
        _nameController.text.length < 3 ||
        _passwordController.text.length < 3) {
      _errorText = "Please Enter valid Data";
      if (mounted) setState(() {});
    } else {
      try {
        // start Loading
        Loading().loading(context);

        // Creating User in Auth
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);

        // Getting Current User Id
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        String userId = user.uid;

        // Sending it's data to DB
        DatabaseReference ref =
            FirebaseDatabase.instance.reference().child("users/$userId");

        await ref.set({
          "name": _nameController.text,
          "created_at": ServerValue.timestamp,
        });

        // stop Loading
        Navigator.of(context).pop();

        // Navigate to another screen
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Search()));
      } on PlatformException catch (e) {
        Navigator.of(context).pop(); // pop Loading Dialog
        _errorText = e.message;
      } on SocketException catch (e) {
        Navigator.of(context).pop(); // pop Loading Dialog
        _errorText = e.message;
      } catch (e) {
        Navigator.of(context).pop(); // pop Loading Dialog
        _errorText = e.toString();
      } finally {
        // rebuild state if exist;
        if (mounted) setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              "Your Name",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              "Email",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              "Password",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              "$_errorText",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    splashColor: Colors.blue,
                    color: Colors.blue,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "SignUp",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Transform.translate(
                          offset: Offset(10.0, 0.0),
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0)),
                              splashColor: Colors.white,
                              color: Colors.white,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                              ),
                              onPressed: () => _submit(),
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () => _submit(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0),
                      alignment: Alignment.center,
                      child: Text(
                        "HAVE AN ACCOUNT?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignIn())),
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
