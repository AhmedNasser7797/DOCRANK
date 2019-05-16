import 'package:final1/Feedback_Answer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateModel {
  String id;
  String userEmail;
  double rate1;
  double rate2;
  double rate3;
  double rate4;
  double averageRating;
  String dateOfFeedBack;
  String behaviour;
  String waitingTime;

  RateModel();

  RateModel.fromJson(key, value) {
    if (value != null) {
      this.id = key;
      this.userEmail = value["userEmail"] ?? "";
      this.dateOfFeedBack = value["dateOfFeedBack"] ?? "";
      this.behaviour = value["behaviour"] ?? "";
      this.waitingTime = value["waitingTime"] ?? "";
      this.rate1 = double.parse((value["rate1"] ?? 0.0).toString());
      this.rate2 = double.parse((value["rate2"] ?? 0.0).toString());
      this.rate3 = double.parse((value["rate3"] ?? 0.0).toString());
      this.rate4 = double.parse((value["rate4"] ?? 0.0).toString());
      this.averageRating =
          double.parse((value["averageRating"] ?? 0.0).toString());
    }
  }
}

class RateCard extends StatelessWidget {
  final RateModel data;
  RateCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => FeedbackAnswer(data))),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.blue)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${data.userEmail}"),
              SmoothStarRating(
                starCount: 5, //put rating variable here
                rating: data.averageRating,
                size: 35.0,
                color: Colors.yellow,
                borderColor: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
