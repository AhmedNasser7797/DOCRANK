import 'package:final1/Feedback_Answer.dart';
import 'package:final1/question.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Doctor extends StatefulWidget {
  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    var doctorName;
    var Doctor_Phone;
    var Doctor_City;
    var Doctor_Address;
    var Doctor_work_time;
    var rating = 1.0;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("DocRank"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: new Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 5.0, right: 5.0, bottom: 10.0)),

                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          'assets/images/doc1.jpg',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text("Name:"),
                          new Text(
                            "${doctorName}",
                            style: new TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          new Text("Phone:"),
                          new Text(
                            "${Doctor_Phone}",
                            style: new TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          new Text("City:"),
                          new Text(
                            "${Doctor_City}",
                            style: new TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          new Text(
                            "Doctor Address",
                          ),
                          new Text(
                            "${Doctor_Address}",
                            style: new TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          new Text("Doctor work time"),
                          new Text(
                            "${Doctor_work_time}",
                            style: new TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 30.0, right: 5.0, bottom: 10.0)),

                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .7,
                    padding: EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    "List Of Feedback from Users",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),

                Center(
                  child: Text(
                    ""
                    "click On Username to see Feedback",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),

                // start user Feedback
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.blue)),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              child: Text("User Name"),
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Feedback_Answer()),
                                  ),
                            ),
                            SmoothStarRating(
                              starCount: 5, //put rating variable here
                              rating: rating,
                              size: 35.0,
                              color: Colors.yellow,
                              borderColor: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // End Of First User
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.blue)),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          child: Text("User Name"),
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Feedback_Answer()),
                              ),
                        ),
                        SmoothStarRating(
                          starCount: 5, //put rating variable here
                          rating: rating,
                          size: 35.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 10)),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.blue)),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          child: Text("User Name"),
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Feedback_Answer()),
                              ),
                        ),
                        SmoothStarRating(
                          starCount: 5, //put rating variable here
                          rating: rating,
                          size: 35.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionsPage(null)),
            );
          },
          tooltip: 'Add Doctor',
          child: Icon(Icons.person_add)),
    );
  }
}
