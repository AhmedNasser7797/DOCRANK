import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
            title: new Center(
              child:Text("Sign In") ,
            )
        ),
        body: new Container(
          padding: const EdgeInsets.only(
              right: 20.0, left: 20.0, top: 0.0, bottom: 0.0),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/sky.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 100.0,
                width: 100.0,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Container(
                  height: 55,
                  margin: const EdgeInsets.only(bottom: 30.0),
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
                  margin: const EdgeInsets.only(bottom: 30.0),
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
                  margin: const EdgeInsets.only(bottom: 30.0),
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
              new Expanded(
                child: new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: new RaisedButton(
                          padding: const EdgeInsets.all(16.0),
                          textColor: Colors.blue,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text("Back"),
                        ),
                      ),
                      Expanded(
                        child: new Column(),
                      ),
                      new Align(
                        alignment: FractionalOffset.bottomRight,
                        child: new RaisedButton(
                          /*onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuestionsPage(title: "Questions",)),
                          ),*/
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
                ),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}

