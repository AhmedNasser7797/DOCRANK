import 'package:final1/loading.dart';
import 'package:final1/models/doctor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionsPage extends StatefulWidget {
  final DoctorModel doctorData;

  QuestionsPage(this.doctorData);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuestionsPage> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _behaviourController = TextEditingController();
  final TextEditingController _waitingController = TextEditingController();
  String _errorText = "";

  String message1 = "Rank is 0.0";
  String message2 = "Rank is 0.0";
  String message3 = "Rank is 0.0";
  String message4 = "Rank is 0.0";

  _saveDataAndNavigate() async {
    if (_priceController.text.length < 3 ||
        _behaviourController.text.length < 3 ||
        _waitingController.text.length < 3) {
      _errorText = "Please Enter valid Data";
      if (mounted) setState(() {});
    } else {
      try {
        // start Loading
        Loading().loading(context);

        // Getting Current User Id
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        String userId = user.uid;

        // Sending it's data to DB
        DatabaseReference ref =
            FirebaseDatabase.instance.reference().child("doctors");

        DatabaseReference newDocRef = ref.push();

        await newDocRef.set({
          "name": widget.doctorData.name,
          "qualifications": widget.doctorData.qualifications,
          "address": widget.doctorData.address,
          "phone": widget.doctorData.phone,
          "workTime": widget.doctorData.workTime,
          "dateOfFeedBack": widget.doctorData.dateOfFeedBack,
          "created_at": ServerValue.timestamp,
        });

        await newDocRef.child("ratings/$userId").set({
          "userEmail": "${user.email}",
          "price": _priceController.text,
          "behaviour": _behaviourController.text,
          "waitingTime": _waitingController.text,
          "averageRating":
              "${(widget.doctorData.rate1 + widget.doctorData.rate2 + widget.doctorData.rate3 + widget.doctorData.rate4) / 4}"
        });

        // stop Loading
        Navigator.of(context).pop();

        // Navigate to prev screen
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } on PlatformException catch (e) {
        // stop Loading
        Navigator.of(context).pop();
        _errorText = e.message;
        if (mounted) setState(() {});
      }
    }
  }

  void changed1(e) {
    setState(() {
      widget.doctorData.rate1 = e;
      message1 = "Rank is    ${e.toString()}";
    });
  }

  void changed2(e) {
    setState(() {
      widget.doctorData.rate2 = e;
      message2 = "Rank is   ${e.toString()}";
    });
  }

  void changed3(e) {
    setState(() {
      widget.doctorData.rate3 = e;
      message3 = "Rank is   ${e.toString()}";
    });
  }

  void changed4(e) {
    setState(() {
      widget.doctorData.rate4 = e;
      message4 = "Rank is   ${e.toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
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
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            image: DecorationImage(
                              image: AssetImage("assets/images/doc1.jpg"),
                              fit: BoxFit.cover,
                            ),
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
                              "${widget.doctorData.name}", //doctor name
                              style: TextStyle(fontSize: 16),
                            ),
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Container(
                            child: Text(
                              "${widget.doctorData.dateOfFeedBack}", // date of feedback
                              style: TextStyle(color: Colors.grey),
                            ),
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                        ],
                      ),
                    ),
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
                                      divisions: 10,
                                      max: 5,
                                      min: 0,
                                      value: widget.doctorData.rate1 ?? 0,
                                      onChanged: changed1,
                                      label: "Rank",
                                      activeColor: Colors.blue,
                                      inactiveColor: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      message1,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w900,
                                      ),
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
                                    child: Slider(
                                      divisions: 10,
                                      max: 5,
                                      min: 0,
                                      value: widget.doctorData.rate2 ?? 0,
                                      onChanged: changed2,
                                      label: "Rank",
                                      activeColor: Colors.blue,
                                      inactiveColor: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      message2,
                                      style: TextStyle(
                                          fontSize: 15,
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
                                    child: Slider(
                                      divisions: 10,
                                      max: 5,
                                      min: 0,
                                      value: widget.doctorData.rate3 ?? 0,
                                      onChanged: changed3,
                                      label: "Rank",
                                      activeColor: Colors.blue,
                                      inactiveColor: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      message3,
                                      style: TextStyle(
                                          fontSize: 15,
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
                                    child: Slider(
                                      divisions: 10,
                                      max: 5,
                                      min: 0,
                                      value: widget.doctorData.rate4 ?? 0,
                                      onChanged: changed4,
                                      label: "Rank",
                                      activeColor: Colors.blue,
                                      inactiveColor: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      message4,
                                      style: TextStyle(
                                          fontSize: 15,
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
                      width: 50,
                      padding: EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: _priceController,
                        keyboardAppearance: Brightness.dark,
                        scrollPadding: EdgeInsets.all(10.0),
                        decoration: InputDecoration(
                          labelText: "Price :  LE",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        style: TextStyle(color: Colors.amber),
                        autocorrect: true,
                        textAlign: TextAlign.center,
                        enableInteractiveSelection: true,
                      ),
                    ),
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
                          TextField(
                            controller: _behaviourController,
                            keyboardAppearance: Brightness.dark,
                            scrollPadding: EdgeInsets.all(10.0),
                            decoration: InputDecoration(
                              labelText: "Behaviour",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            style: TextStyle(color: Colors.amber),
                            autocorrect: true,
                            textAlign: TextAlign.center,
                            enableInteractiveSelection: true,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            "Waiting Time",
                          ),
                          TextField(
                            controller: _waitingController,
                            keyboardAppearance: Brightness.dark,
                            scrollPadding: EdgeInsets.all(10.0),
                            decoration: InputDecoration(
                              labelText: "Waiting Time",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            style: TextStyle(color: Colors.amber),
                            autocorrect: true,
                            textAlign: TextAlign.center,
                            enableInteractiveSelection: true,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        "$_errorText",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "back ",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepPurple,
                        ),
                        MaterialButton(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () => _saveDataAndNavigate(),
                          child: Text(
                            "next ",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepPurple,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
