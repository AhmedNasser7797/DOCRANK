import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import './List_Of_Doctor.dart';

class Feedback_Answer extends StatefulWidget {


  @override
  _Feedback_AnswerState createState() => _Feedback_AnswerState();
}

class _Feedback_AnswerState extends State<Feedback_Answer> {
  double val1=0.0;
  double val2=0.0;
  double val3=0.0;
  double val4=0.0;

  var rating=1.0;
  var Price;
  var Behaviour;
  var Waiting_Time;
  var feedback_date;
  var user_name;

  String Message1="Rank is 0.0";
  String Message2="Rank is 0.0";
  String Message3="Rank is 0.0";
  String Message4="Rank is 0.0";


  @override
  Widget build(BuildContext context) {
    void changed1(e){
      setState(() {
        val1 = e;
        Message1 = "Rank is    ${e.toString()}";
      });
    }
    void changed2(e){
      setState(() {
        val2 = e;
        Message2 = "Rank is   ${e.toString()}";
      });
    }
    void changed3(e){
      setState(() {
        val3 = e;
        Message3 = "Rank is   ${e.toString()}";
      });
    }
    void changed4(e){
      setState(() {
        val4 = e;
        Message4 = "Rank is   ${e.toString()}";
      });
    }





    return Scaffold(
      appBar: AppBar(

        title: Text("FeedBack"),centerTitle: true,
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
                decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Container(

                        height: 100,
                        width: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                            image: DecorationImage(
                                image: AssetImage("assets/images/doc1.jpg"),//user Image

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
                              "User Name:${user_name}",//doctor name
                              style: TextStyle(fontSize: 16),
                            ),
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Container(
                            child: Text(
                              "Date : 12/2/2018${feedback_date}", // date of feedback
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


                                    child:  new SmoothStarRating(
                                        starCount: 5, //put rating variable here
                                        rating: rating,
                                        size: 35.0,
                                        color: Colors.yellow,
                                        borderColor: Colors.yellow,

                                    ),


                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))
                        )
                    ),
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


                                    child:   new SmoothStarRating(
                                starCount: 5, //put rating variable here
                                rating: rating,
                                size: 35.0,
                                color: Colors.yellow,
                                borderColor: Colors.yellow,

                              ),


                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))
                        )
                    ),
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


                                    child: new SmoothStarRating(
                                      starCount: 5, //put rating variable here
                                      rating: rating,
                                      size: 35.0,
                                      color: Colors.yellow,
                                      borderColor: Colors.yellow,

                                    ),

                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))
                        )
                    ),
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


                                    child:  new SmoothStarRating(
                                      starCount: 5, //put rating variable here
                                      rating: rating,
                                      size: 35.0,
                                      color: Colors.yellow,
                                      borderColor: Colors.yellow,

                                    ),


                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))
                        )
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.only(top: 10),
                      child: new Text("Price is : ${Price}",
                      style: TextStyle(fontSize: 20)),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Comments:",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text("Behaviour",),
                          new Text("Behaviour is : ${Behaviour}",
                              style: TextStyle(fontSize: 20)),

                          Padding(padding: EdgeInsets.all(5)),

                          Text("Waiting Time",),
                          new Text("Waiting Time is : ${Waiting_Time}",
                              style: TextStyle(fontSize: 20)),
                          Padding(padding: EdgeInsets.all(5)),

                        ],
                      ),
                    ),




                  ],
                ),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListOfDoctors()),
          ),
          tooltip: 'Done',
          child: Icon(Icons.person_add)
      ), // This trai
    );
  }
}
