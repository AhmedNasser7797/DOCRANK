import 'package:final1/models/rate_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedbackAnswer extends StatefulWidget {
  final RateModel data;
  FeedbackAnswer(this.data);
  @override
  _FeedbackAnswerState createState() => _FeedbackAnswerState();
}

class _FeedbackAnswerState extends State<FeedbackAnswer> {
  @override
  Widget build(BuildContext context) {
//    String Message1 = "Rank is ${widget.data.rate1}";
//    String Message2 = "Rank is ${widget.data.rate2}";
//    String Message3 = "Rank is ${widget.data.rate3}";
//    String Message4 = "Rank is ${widget.data.rate4}";

    return Scaffold(
      appBar: AppBar(
        title: Text("FeedBack"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Container(
                        height: 100,
                        width: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            image: DecorationImage(
                                image: AssetImage("assets/images/doc1.jpg"),
                                //user Image

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
                              "User Email:${widget.data.userEmail}",
                              style: TextStyle(fontSize: 16),
                            ),
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Container(
                            child: Text(
                              "Date : ${widget.data.dateOfFeedBack}",
                              // date of feedback
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
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      //put rating variable here
                                      rating: widget.data.rate1,
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
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      //put rating variable here
                                      rating: widget.data.rate2,
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
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      //put rating variable here
                                      rating: widget.data.rate3,
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
                                    child: SmoothStarRating(
                                      starCount: 5,
                                      //put rating variable here
                                      rating: widget.data.rate4,
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
                                bottom: BorderSide(color: Colors.black)))),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Comments:",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Behaviour",
                          ),
                          Text("Behaviour is : ${widget.data.behaviour}",
                              style: TextStyle(fontSize: 20)),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            "Waiting Time",
                          ),
                          Text("Waiting Time is : ${widget.data.waitingTime}",
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
    );
  }
}
