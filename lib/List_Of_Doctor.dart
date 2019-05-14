import 'package:final1/doctor_page.dart';
import 'package:final1/insert_doctor.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ListOfDoctors extends StatefulWidget {





  //ListOfDoctors(this.name, this.rating);

  @override
  _ListOfDoctorsState createState() => _ListOfDoctorsState();
}

class _ListOfDoctorsState extends State<ListOfDoctors> {
  String name;
  var rating=0.0;

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


                    InkWell(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/doc1.jpg'),
                        ),
                      ),
        highlightColor: Colors.white,
        splashColor: Colors.white,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => doctor_page()),
        ),
      ),


                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      children: <Widget>[



                        Text("Dr. zakria",style: TextStyle(fontSize: 25) ,),
                        Text("400 LE"),
                        SmoothStarRating(
                          starCount: 5, //put rating variable here
                          rating: rating,
                          size: 35.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                          onRatingChanged: (value) {
                           setState(() {
                               rating = value;
                                       });}
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

      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => insert_doctor()),
          ),
          tooltip: 'Add Doctor',
          child: Icon(Icons.person_add)
      ), // This trai
    );
  }
}
