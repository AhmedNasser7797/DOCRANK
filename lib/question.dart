import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuestionsPage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Qyestions"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/user.webp"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Mohamed",
                                style: TextStyle(fontSize: 16),
                              ),
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                            Container(
                              child: Text(
                                "12/2/2018",
                                style: TextStyle(color: Colors.grey),
                              ),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 280,
                                      child: Slider(
                                          value: 0.8,
                                          onChanged: (value) =>
                                              debugPrint(value.toString())),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)))),
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 280,
                                      child:
                                      Slider(
                                          value: 0.8,
                                          onChanged: (value) =>
                                              debugPrint(value.toString())),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)))),
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 280,
                                      child:
                                      Slider(
                                          value: 0.8,
                                          onChanged: (value) =>
                                              debugPrint(value.toString())),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)))),
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 280,
                                      child:
                                      Slider(
                                          value: 0.8,
                                          onChanged: (value) =>
                                              debugPrint(value.toString())),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)))),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Price: 50LE",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Comment:",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Comment Text Comment Text Comment Text Comment Text Comment Text Comment Text Comment Text ",
                                style: TextStyle(fontSize: 16, color: Colors.grey, fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
