import 'package:final1/Doctor.dart';
import 'package:final1/models/rate_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DoctorModel {
  String id;
  String name;
  String qualifications;
  String address;
  String phone;
  String workTime;
  String price;
  List<RateModel> rating = List<RateModel>();

  DoctorModel();

  DoctorModel.fromJson(String id, Map data) {
    if (data != null) {
      this.id = id;
      this.name = data['name'] ?? "";
      this.qualifications = data['qualifications'] ?? "";
      this.address = data['address'] ?? "";
      this.phone = data['phone'] ?? "";
      this.workTime = data['workTime'] ?? "";
      this.price = data['price'] ?? "";

      if (data['ratings'] != null) {
        Map<dynamic, dynamic> ratings = data['ratings'];
        ratings.forEach((key, value) {
          if (value != null) {
            this.rating.add(RateModel.fromJson(key, value));
          }
        });
      }
    }
  }
}

class DoctorCard extends StatelessWidget {
  final DoctorModel data;

  DoctorCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Doctor(data)),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SingleChildScrollView(

            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[


                Padding(padding: EdgeInsets.only(left: 1)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,

                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/images/doc1.jpg'),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),

                Column(
                  children: <Widget>[

                    Text(
                      "Dr. ${data.name}",
                      style: TextStyle(fontSize: 25,),
                    ),
                    SmoothStarRating(
                      starCount: 5,
                      rating: 2.5,
                      // TODO :(Nassef) => find a way to view av of av of user
                      size: 35.0,
                      color: Colors.yellow,
                      borderColor: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
