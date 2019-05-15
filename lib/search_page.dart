import 'package:final1/List_Of_Doctor.dart';
import 'package:final1/List_Of_Doctors.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("DocRank"),centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),

      body:Container(
        alignment: Alignment.topCenter,
      child:Container(
      //  color: Colors.white,
        padding: EdgeInsets.only(left: 10,right: 10),
        decoration: new BoxDecoration(image: new DecorationImage(
            image: new AssetImage("assets/images/ss.jpg"),
            fit: BoxFit.cover)
        ),


        child:ListView(

          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 100.0,
              width: 100.0,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/logo.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 50)),

            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 60,
              decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.blue),
                  borderRadius:BorderRadius.circular(30.0)),
              child: ListTile(leading: Icon(Icons.search),onTap:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => List_Of_Doctors()),
                );
              },
                title: new TextField(decoration: InputDecoration(hintText: "Search By Specialist...",
                  hintStyle: TextStyle(color: Colors.cyan),
                )
                  ,)
                ,),
            ),

            Padding(padding: EdgeInsets.only(top: 20)),

            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 60,
              decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.blue),
                  borderRadius:BorderRadius.circular(30.0)),
              child: ListTile(leading: Icon(Icons.location_city),onTap:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListOfDoctors()),
                );
              },
                title: new TextField(decoration: InputDecoration(hintText: "Search By City...",
                  hintStyle: TextStyle(color: Colors.cyan),
                )
                  ,)
                ,),
            )
          ],

        ),
      ),


    ),


      floatingActionButton: FloatingActionButton(onPressed:  () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListOfDoctors()),
        );
      },tooltip: "go to Doctors",child: Icon(Icons.arrow_right),),


    );
  }
}
