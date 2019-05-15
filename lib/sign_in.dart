import 'package:flutter/material.dart';

import './search.dart';
import './sign_up.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sign In"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ss.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 40.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    new Expanded(
                      child: TextField(
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
              Container(
                  height: 50,
                  margin:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
                  child: ListTile(
                    leading: Icon(Icons.phone_iphone),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: "password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.blue, width: 3))),
              Container(
                child: InkWell(
                  child: Text(
                    "Have no account? Sign up here",
                    style: TextStyle(color: Colors.blue),
                  ),
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: RaisedButton(
                          padding: EdgeInsets.all(16.0),
                          textColor: Colors.blue,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text("Back"),
                        ),
                      ),
                      Expanded(
                        child: Column(),
                      ),
                      Align(
                        alignment: FractionalOffset.bottomRight,
                        child: RaisedButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => search()),
                              ),
                          textColor: Colors.white,
                          color: Colors.blue,
                          padding: EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(
                            "Done",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
