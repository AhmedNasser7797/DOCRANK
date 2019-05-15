import 'package:final1/models/doctor_model.dart';
import 'package:flutter/material.dart';

import './question.dart';

class InsertDoctor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InsertDoctorState();
}

class InsertDoctorState extends State<InsertDoctor> {
  DoctorModel doctorData = DoctorModel();
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  _saveDataAndNavigate() {
    FormState state = _fromKey.currentState;
    if (state.validate()) {
      state.save();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuestionsPage(doctorData)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
//        backgroundColor: Colors.white,
        title: Text(
          "Insert new Doctor",
//          style: TextStyle(
//            color: Colors.black,
//          ),
        ),
      ),
      body: Form(
        key: _fromKey,
        child: Container(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,

              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, top: 10.0, bottom: 10.0),

              // margin: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    validator: (val) => val.length < 3 ? "not Valid" : null,
                    onSaved: (val) => doctorData.name = val,
                    keyboardAppearance: Brightness.dark,
                    scrollPadding: EdgeInsets.all(10.0),
                    decoration: InputDecoration(
                      labelText: "Doctor name:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    style: TextStyle(color: Colors.amber),
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    enableInteractiveSelection: true,
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  TextFormField(
                    validator: (val) => val.length < 3 ? "not Valid" : null,
                    onSaved: (val) => doctorData.qualifications = val,
                    keyboardAppearance: Brightness.dark,
                    scrollPadding: EdgeInsets.all(10.0),
                    decoration: InputDecoration(
                      labelText: "Qualifications:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    style: TextStyle(color: Colors.amber),
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    enableInteractiveSelection: true,
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  TextFormField(
                    validator: (val) => val.length < 3 ? "not Valid" : null,
                    onSaved: (val) => doctorData.address = val,
                    keyboardAppearance: Brightness.dark,
                    scrollPadding: EdgeInsets.all(10.0),
                    decoration: InputDecoration(
                      labelText: "Address of clinic:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    style: TextStyle(color: Colors.amber),
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    enableInteractiveSelection: true,
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  TextFormField(
                    validator: (val) => val.length < 3 ? "not Valid" : null,
                    onSaved: (val) => doctorData.phone = val,
                    keyboardAppearance: Brightness.dark,
                    scrollPadding: EdgeInsets.all(10.0),
                    decoration: InputDecoration(
                      labelText: "Phone:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    style: TextStyle(color: Colors.amber),
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    enableInteractiveSelection: true,
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  TextFormField(
                    validator: (val) => val.length < 3 ? "not Valid" : null,
                    onSaved: (val) => doctorData.workTime = val,
                    keyboardAppearance: Brightness.dark,
                    scrollPadding: EdgeInsets.all(10.0),
                    decoration: InputDecoration(
                      labelText: "Work time:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    style: TextStyle(color: Colors.amber),
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    enableInteractiveSelection: true,
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  TextFormField(
                    validator: (val) => val.length < 3 ? "not Valid" : null,
                    onSaved: (val) => doctorData.dateOfFeedBack = val,
                    keyboardAppearance: Brightness.dark,
                    scrollPadding: EdgeInsets.all(10.0),
                    decoration: InputDecoration(
                      labelText: "Date of your feedback:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    style: TextStyle(color: Colors.amber),
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    enableInteractiveSelection: true,
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
            )),
      ),
    );
  }
}
