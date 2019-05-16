import 'package:final1/List_Of_Doctor.dart';
import 'package:final1/insert_doctor.dart';
import 'package:final1/loading.dart';
import 'package:final1/models/doctor_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _depController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  List<DoctorModel> doctors = List<DoctorModel>();

  _searchByDep(String value) async {
    try {
      Loading().loading(context);
      // formatting List
      doctors = List<DoctorModel>();

      // Query DB
      Query ref = FirebaseDatabase.instance
          .reference()
          .child("doctors")
          .orderByChild("qualifications")
          .equalTo("$value");

      // Getting Data and adding to List [doctors]
      await ref.once().then((result) {
        if (result.value != null) {
          Map<dynamic, dynamic> value = result.value;
          value.forEach((key, data) {
            doctors.add(DoctorModel.fromJson(key, data));
          });
        }
      });

      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ListOfDoctors(doctors)));
    } catch (e) {
      // remove loading
      print(e.toString());
      Navigator.of(context).pop();
    }
  }

  _searchByCity(String value) async {
    try {
      Loading().loading(context);
      // formatting List
      doctors = List<DoctorModel>();

      // Query DB
      Query ref = FirebaseDatabase.instance
          .reference()
          .child("doctors")
          .orderByChild("address")
          .equalTo("$value");

      // Getting Data and adding to List [doctors]
      await ref.once().then((result) {
        if (result.value != null) {
          Map<dynamic, dynamic> value = result.value;
          value.forEach((key, data) {
            doctors.add(DoctorModel.fromJson(key, data));
          });
        }
      });

      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ListOfDoctors(doctors)));
    } catch (e) {
      // remove loading
      print(e.toString());
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ss.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: (val) => _searchByDep(val),
                        controller: _depController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search By Dep.',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Icon(
                        Icons.youtube_searched_for,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: (val) => _searchByCity(val),
                        controller: _cityController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search By City',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InsertDoctor()),
          );
        },
        tooltip: "Add Doctor",
        child: Icon(Icons.person_add),
      ),
    );
  }
}
