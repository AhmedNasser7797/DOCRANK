import 'package:final1/models/doctor_model.dart';
import 'package:final1/models/rate_model.dart';
import 'package:final1/question.dart';
import 'package:flutter/material.dart';

class Doctor extends StatefulWidget {
  final DoctorModel data;
  Doctor(this.data);

  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  List<RateCard> ratings = List<RateCard>();

  @override
  void initState() {
    super.initState();
    widget.data.rating?.forEach((rateaya) {
      ratings.add(RateCard(rateaya));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.data.name}"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    top: 0.0,
                    left: 5.0,
                    right: 5.0,
                    bottom: 10.0,
                  ),
                ),
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
                          Text("Name:"),
                          Text(
                            "${widget.data.name}",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text("Phone:"),
                          Text(
                            "${widget.data.phone}",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text("City:"),
                          Text(
                            "${widget.data.address}",
                            style: TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text("Doctor work time"),
                          Text(
                            "${widget.data.workTime}",
                            style: TextStyle(
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
                    top: 0.0,
                    left: 30.0,
                    right: 5.0,
                    bottom: 10.0,
                  ),
                ),

                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.7,
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
                    "click On Username to see Feedback",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                // add rating list
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: ratings,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionsPage(
                        widget.data,
                        existingDoctor: true,
                      )),
            );
          },
          tooltip: 'Add Rating',
          child: Icon(Icons.person_add)),
    );
  }
}
