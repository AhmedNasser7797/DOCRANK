import 'package:flutter/material.dart';
import './question.dart';

class insert_doctor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new insert_doctorState();
  }
}

class insert_doctorState extends State<insert_doctor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: new Text("DocRank"),
        backgroundColor: Colors.lightBlue,
      ),
      body: new Container(
        margin: EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
          children: <Widget>[
            new Text(
              "ahmed",
              style: new TextStyle(color: Colors.deepOrange),
            ),
            new TextField(
              keyboardAppearance: Brightness.dark,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: InputDecoration(
                labelText: "Doctor name:",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              style: new TextStyle(color: Colors.amber),
              autocorrect: true,
              textAlign: TextAlign.center,
              enableInteractiveSelection: true,
            ),
            new TextField(
              keyboardAppearance: Brightness.dark,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: InputDecoration(
                labelText: "Qualifications:",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              style: new TextStyle(color: Colors.amber),
              autocorrect: true,
              textAlign: TextAlign.center,
              enableInteractiveSelection: true,
            ),
            new TextField(
              keyboardAppearance: Brightness.dark,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: InputDecoration(
                labelText: "Address of clinic:",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              style: new TextStyle(color: Colors.amber),
              autocorrect: true,
              textAlign: TextAlign.center,
              enableInteractiveSelection: true,
            ),
            new TextField(
              keyboardAppearance: Brightness.dark,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: InputDecoration(
                labelText: "Phone:",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              style: new TextStyle(color: Colors.amber),
              autocorrect: true,
              textAlign: TextAlign.center,
              enableInteractiveSelection: true,
            ),
            new TextField(
              keyboardAppearance: Brightness.dark,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: InputDecoration(
                labelText: "Work time:",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              style: new TextStyle(color: Colors.amber),
              autocorrect: true,
              textAlign: TextAlign.center,
              enableInteractiveSelection: true,
            ),
            new TextField(
              keyboardAppearance: Brightness.dark,
              scrollPadding: EdgeInsets.all(10.0),
              decoration: InputDecoration(
                labelText: "Date of your feedback:",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              style: new TextStyle(color: Colors.amber),
              autocorrect: true,
              textAlign: TextAlign.center,
              enableInteractiveSelection: true,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new MaterialButton(
                  onPressed: () {
    Navigator.pop(
    context,);},
                  child: new Text(
                    "back ",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurple,
                ),

                new MaterialButton(

                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionsPage()),
                    );
                  },
                  child: new Text(
                    "next ",
                    style: new TextStyle(color: Colors.white),

                  ),
                  color: Colors.deepPurple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
