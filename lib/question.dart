import 'package:final1/loading.dart';
import 'package:final1/models/doctor_model.dart';
import 'package:final1/models/rate_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionsPage extends StatefulWidget {
  final DoctorModel doctorData;
  final bool existingDoctor;

  QuestionsPage(this.doctorData, {this.existingDoctor = false});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuestionsPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _behaviourController = TextEditingController();
  final TextEditingController _waitingController = TextEditingController();
  RateModel rate = RateModel();
  String _errorText = "";

  String message1 = "Rank is 0.0";
  String message2 = "Rank is 0.0";
  String message3 = "Rank is 0.0";
  String message4 = "Rank is 0.0";

  _saveNewDocData() async {
    if (_dateController.text.length < 3 ||
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
          "price": widget.doctorData.price,
          "created_at": ServerValue.timestamp,
        });

        await newDocRef.child("ratings/$userId").set({
          "userEmail": "${user.email}",
          "dateOfFeedBack": _dateController.text,
          "behaviour": _behaviourController.text,
          "waitingTime": _waitingController.text,
          "rate1": rate.rate1,
          "rate2": rate.rate2,
          "rate3": rate.rate3,
          "rate4": rate.rate4,
          "averageRating":
              ((rate.rate1 + rate.rate2 + rate.rate3 + rate.rate4) / 4)
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

  _saveRatingOnly() async {
    if (_dateController.text.length < 3 ||
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
        DatabaseReference ref = FirebaseDatabase.instance
            .reference()
            .child("doctors/${widget.doctorData.id}");

        await ref.child("ratings/$userId").set({
          "userEmail": "${user.email}",
          "dateOfFeedBack": _dateController.text,
          "behaviour": _behaviourController.text,
          "waitingTime": _waitingController.text,
          "rate1": double.parse(rate.rate1.toString()),
          "rate2": double.parse(rate.rate2.toString()),
          "rate3": double.parse(rate.rate3.toString()),
          "rate4": double.parse(rate.rate4.toString()),
          "averageRating": double.parse(
              ((rate.rate1 + rate.rate2 + rate.rate3 + rate.rate4) / 4.0)
                  .toString())
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
      } catch (e) {
        _errorText = e.toString();
        if (mounted) setState(() {});
      }
    }
  }

  void changed1(e) {
    setState(() {
      rate.rate1 = e;
      message1 = "Rank is    ${e.toString()}";
    });
  }

  void changed2(e) {
    setState(() {
      rate.rate2 = e;
      message2 = "Rank is   ${e.toString()}";
    });
  }

  void changed3(e) {
    setState(() {
      rate.rate3 = e;
      message3 = "Rank is   ${e.toString()}";
    });
  }

  void changed4(e) {
    setState(() {
      rate.rate4 = e;
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
                              "${DateTime.now().year} / "
                              "${DateTime.now().month} / "
                              "${DateTime.now().day}", // date of feedback
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
                                      value: rate.rate1 ?? 0,
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
                                      value: rate.rate2 ?? 0,
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
                                      value: rate.rate3 ?? 0,
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
                                      value: rate.rate4 ?? 0,
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
                        controller: _dateController,
                        keyboardAppearance: Brightness.dark,
                        scrollPadding: EdgeInsets.all(10.0),
                        decoration: InputDecoration(
                          labelText: "Date of Feedback :",
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
                          onPressed: () => widget.existingDoctor
                              ? _saveRatingOnly()
                              : _saveNewDocData(),
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
