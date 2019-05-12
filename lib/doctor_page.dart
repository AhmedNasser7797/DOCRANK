import 'package:flutter/material.dart';
import './question.dart';
class doctor_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new doctor_pageState();
  }

}
class doctor_pageState  extends State<doctor_page>{
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
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(30.0),
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 80.0,
                  semanticLabel: 'menu',
                ),
                onPressed: () {
                  print('Menu button');
                },
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: <Widget>[
                  new Text(
                    "Doctor Name",

                    style: new TextStyle(color: Colors.deepOrange, ),

                  ),
                  new Text(
                    "Doctor Phone",

                    style: new TextStyle(color: Colors.deepOrange,fontSize: 10.0 ),

                  ),
                  new Text(
                    "Doctor Address",

                    style: new TextStyle(color: Colors.deepOrange,fontSize: 10.0  ),

                  ),
                ],
              ),],),
          new Column(

            mainAxisAlignment: MainAxisAlignment.start ,
            children: <Widget>[

              new Text(
                "1 Feedback",

                style: new TextStyle(color: Colors.deepOrange,fontSize: 20.0  ),

              ),
              new Text(
                "1 Feedback",

                style: new TextStyle(color: Colors.deepOrange,fontSize: 20.0  ),

              ),
              new Text(
                "1 Feedback",
                textScaleFactor: 1.0,
                style: new TextStyle(color: Colors.deepOrange,fontSize: 20.0  ),

              ),
              new Text(
                "1 Feedback",
                textScaleFactor: 1.0,
                style: new TextStyle(color: Colors.deepOrange,fontSize: 20.0  ),

              ),
              new Text(
                "1 Feedback",
                textScaleFactor: 1.0,
                style: new TextStyle(color: Colors.deepOrange,fontSize: 20.0  ),

              ),
              new Text(
                "1 Feedback",
                textScaleFactor: 1.0,
                style: new TextStyle(color: Colors.deepOrange,fontSize: 20.0  ),

              ),
            ],
          ), ],
      ),


      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuestionsPage()),
          ),
          tooltip: 'Add Feedback',
          child: Icon(Icons.add)
      ),


    );
    

  }
}