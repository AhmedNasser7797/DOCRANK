import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ListOfDoctors extends StatefulWidget {

  String name;
  int rating;


  //ListOfDoctors(this.name, this.rating);

  @override
  _ListOfDoctorsState createState() => _ListOfDoctorsState();
}

class _ListOfDoctorsState extends State<ListOfDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DOCRANK",style: TextStyle(color: Colors.white,fontSize: 20),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Icon(Icons.search),
                     Padding(padding: EdgeInsets.only(left: 10)),
                     Container(
                       width: MediaQuery.of(context).size.width * 0.5,
                       child:  TextFormField(
                         decoration: InputDecoration(
                           hintText: "Search...",
                         ),
                       ),
                     ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
              Text("Specialist name :" + "nassef",style: TextStyle(color: Colors.blue),),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text("CLick on Doctor name to show feedback"),
              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),


              Container(
                width: MediaQuery.of(context).size.width*0.9,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue,),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 1)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.2,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('assets/images/doc1.jpg'),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      children: <Widget>[
                        Text("Dr. zakria"),
                        Text("400 LE"),
                        SmoothStarRating(
                          starCount: 3, //put rating variable here
                          rating: 10,
                          size: 20.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                        )
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
