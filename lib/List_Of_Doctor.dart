import 'package:final1/insert_doctor.dart';
import 'package:final1/models/doctor_model.dart';
import 'package:flutter/material.dart';

class ListOfDoctors extends StatefulWidget {
  final List<DoctorModel> doctors;
  ListOfDoctors(this.doctors);

  @override
  _ListOfDoctorsState createState() => _ListOfDoctorsState();
}

class _ListOfDoctorsState extends State<ListOfDoctors> {
  List<DoctorCard> doctorCards = List<DoctorCard>();

  @override
  void initState() {
    super.initState();

    widget.doctors.forEach((doctraya) {
      doctorCards.add(DoctorCard(doctraya));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).padding.left + 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Icon(Icons.search),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search...",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
              Text(
                "Specialist name :" + "nassef",
                style: TextStyle(color: Colors.blue),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text("CLick on Doctor Photo to show feedback"),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
              ),
              Column(
                children: doctorCards,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertDoctor()),
              ),
          tooltip: 'Add Doctor',
          child: Icon(Icons.person_add)), // This trai
    );
  }
}
