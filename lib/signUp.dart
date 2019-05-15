import 'package:final1/search_page.dart';
import 'package:flutter/material.dart';
import 'SignIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
        ),
        body: new Container(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20.0, top: 0.0, bottom: 0.0),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage("assets/images/sky.jpg"),
                fit: BoxFit.cover,
              )),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: new BoxDecoration(
                      //border: Border.all(color: Colors.blue),borderRadius:BorderRadius.circular(100.0) ,
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  new Container(
                      height: 55,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: new ListTile(
                        leading: const Icon(Icons.person),
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.blue, width: 3))),
                  new Container(
                      height: 55,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: new ListTile(
                        leading: const Icon(Icons.phone),
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: "Phone",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.blue, width: 3))),
                  new Container(
                      height: 55,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: new ListTile(
                        leading: const Icon(Icons.phone_android),
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: "password",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.blue, width: 3))),
                  new Container(
                      height: 55,
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: new ListTile(
                        leading: const Icon(Icons.location_on),
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: "city",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.blue, width: 3))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: new RaisedButton(
                          padding: const EdgeInsets.all(16.0),
                          textColor: Colors.blue,
                          color: Colors.white,
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text("Sign In"),
                        ),
                      ),
                      Expanded(
                        child: new Column(),
                      ),
                      new Align(
                        alignment: FractionalOffset.bottomRight,
                        child: new RaisedButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search()),
                              ),
                          textColor: Colors.white,
                          color: Colors.blue,
                          padding: const EdgeInsets.all(16.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text(
                            "Done",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
