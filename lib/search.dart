import 'package:final1/List_Of_Doctor.dart';
import 'package:flutter/material.dart';
import './List_Of_Doctors.dart';
import './doctor_page.dart';
import './insert_doctor.dart';




class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      drawer: IconButton(icon: Icon(Icons.menu), onPressed: null),
      appBar: AppBar(

        title: Text("DocRank"),centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),


      body:



      Container(


          child: Center(
              child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          Flexible(child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Expanded(

                /*  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(icon: Icon(Icons.search),
                      hintText: "insert specialist..  ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  )*/
                
               child:Container(
                  child: ListTile(
                  leading: Icon(Icons.search),title: Text("Search By Specialist..",),),


                  decoration: BoxDecoration(border: Border.all(color: Colors.black54),borderRadius: BorderRadius.circular(30.0)),
                )

             )

              
              
              
              ,Container(
                height: 40.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue,
                ),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed:  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListOfDoctors()),
                    );
                  },
                  iconSize: 30.0,
                ),
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
              ),
            ],


          )
           ),
          Text(
            "OR",
            style: TextStyle(fontSize: 25.0),
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                  child:Container(
                    child: ListTile(
                      leading: Icon(Icons.location_searching),title: Text("Search By City..",),),


                    decoration: BoxDecoration(border: Border.all(color: Colors.blue),borderRadius: BorderRadius.circular(30.0)),
                  )

              ),
              Container(
                height: 40.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue,
                ),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed:  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => List_Of_Doctors()),
                    );
                  },

                  iconSize: 30.0,
                ),
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
              ),
            ],
          ),

        ],
      )


              )
      ),




    );
  }

}
