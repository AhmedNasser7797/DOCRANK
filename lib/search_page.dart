import 'package:final1/List_Of_Doctor.dart';
import 'package:final1/insert_doctor.dart';
import 'package:final1/loading.dart';
import 'package:final1/models/doctor_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:final1/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final1/auth.dart';
import 'root.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  _SearchState({this.auth,this.onSignOut});
final BaseAuth auth ;
final VoidCallback onSignOut;

  final TextEditingController _depController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  List<DoctorModel> doctors = List<DoctorModel>();
  String aa="aaaaaaaaaaaa";

  
String email1="";
 Future<String>  getCurrentUser() async {

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    return user.email;

  }


  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();


    getCurrentUser().then((String qqqq)=> setState (() {email1=qqqq;}));
    setState(() {});

  }


  void _signOut()async{
    try{

      await auth.signOut();
      onSignOut();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SignIn()));


    }
    catch(e){
      print(e);
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SignIn()));
  }

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
   print(getCurrentUser().then((value){return value;})) ;
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
        actions: <Widget>[
          new FlatButton(onPressed: _signOut, child: new Text("LogOut" ,style: new TextStyle(
              color:Colors.white ),)),
        ],
      ),
      drawer: buikdD(context,email1),

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
      print(getCurrentUser());
        },
        tooltip: "Add Doctor",
        child: Icon(Icons.person_add),
      ),
    );
  }
}
Widget buikdD(BuildContext context, String s ,){
  return
   Drawer(

      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ashish Rawat"),
            accountEmail: Text(s),
            currentAccountPicture: CircleAvatar(

              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Ttem 1"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Item 2"),
            trailing: Icon(Icons.arrow_forward),


          ),
        ],
      ),
    //this will just add the Navigation Drawer Icon
  );
}