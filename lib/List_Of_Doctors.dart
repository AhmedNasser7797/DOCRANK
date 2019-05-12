import 'package:flutter/material.dart';
import 'doctor_page.dart';
import 'insert_doctor.dart';

class List_Of_Doctors extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new List_Of_DoctorsState ();
  }
}

class List_Of_DoctorsState extends State<List_Of_Doctors> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("DocRank"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => debugPrint("menu button pressed")),
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(0),
                  child: new ListTile(
                    leading: const Icon(Icons.search),
                    title: new TextField(
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      ),
                      decoration: new InputDecoration(
                        hintText: "Search by Doctor name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(3.0),
                      //border: Border.all(color: Colors.black, width: 1),
                      boxShadow: [
                        new BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            blurRadius: 7,
                            offset: Offset(0, -2)
                        )
                      ]
                  )
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 0
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Specialization name: "
                        ),
                        Text("Heart",
                          style: TextStyle(color: Colors.blue),
                        ),
                        new Expanded(
                            child: Align(
                              alignment: FractionalOffset.centerRight,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20.0),
                                height: 30.0,
                                width: 30.0,
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/heart.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 206,
                      child: ListView(
                        semanticChildCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 40 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc2.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 45 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star_half),
                                          Icon(Icons.star_border),
                                          Icon(Icons.star_border),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc3.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 50 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star_border),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc4.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 40 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc5.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 40 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc6.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 40 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc7.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 40 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 3
                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/doc8.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text("Dr. Hatem Ali"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Text("Price: 40 LE"),
                                        margin: EdgeInsets.only(bottom: 10),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),

            ],
          )
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => insert_doctor()),
          ),
          tooltip: 'Add Doctor',
          child: Icon(Icons.person_add)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
