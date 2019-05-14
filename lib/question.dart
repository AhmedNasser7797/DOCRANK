import 'package:flutter/material.dart';
import './List_Of_Doctor.dart';
class QuestionsPage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuestionsPage> {
  double val1=0.0;
  double val2=0.0;
  double val3=0.0;
  double val4=0.0;

  String Message1="Rank is 0.0";
  String Message2="Rank is 0.0";
  String Message3="Rank is 0.0";
  String Message4="Rank is 0.0";


  @override
  Widget build(BuildContext context) {
    void changed1(e){
      setState(() {
        val1 = e;
        Message1 = "Rank is    ${e.toString()}";
      });
    }
    void changed2(e){
      setState(() {
        val2 = e;
        Message2 = "Rank is   ${e.toString()}";
      });
    }
    void changed3(e){
      setState(() {
        val3 = e;
        Message3 = "Rank is   ${e.toString()}";
      });
    }
    void changed4(e){
      setState(() {
        val4 = e;
        Message4 = "Rank is   ${e.toString()}";
      });
    }

    return Scaffold(
        appBar: AppBar(

          title: Text("Questions"),centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
        ),


        body: Container(

          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Container(

                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/doc1.jpg"),//user Image

                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Mohamed",//doctor name
                                style: TextStyle(fontSize: 16),
                              ),
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                            Container(
                              child: Text(
                                "12/2/2018", // date of feedback
                                style: TextStyle(color: Colors.grey),
                              ),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[

                                    Container(

                                      width: 280,


                                        child:  new Slider(
                                            divisions: 10 ,
                                            max: 5,
                                            min: 0,
                                            value: val1,
                                            onChanged:  changed1
                                            ,label: "Rank",
                                            activeColor: Colors.blue,
                                            inactiveColor: Colors.grey,
                                          ),


                                    ),
                                    Expanded(
                                      child: Text(
                                        Message1,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black))
                          )
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[

                                    Container(

                                      width: 280,


                                      child:  new Slider(
                                        divisions: 10 ,
                                        max: 5,
                                        min: 0,
                                        value: val2,
                                        onChanged:  changed2
                                        ,label: "Rank",
                                        activeColor: Colors.blue,
                                        inactiveColor: Colors.grey,
                                      ),


                                    ),
                                    Expanded(
                                      child: Text(
                                        Message2,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black))
                          )
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[

                                    Container(

                                      width: 280,


                                      child:  new Slider(
                                        divisions: 10 ,
                                        max: 5,
                                        min: 0,
                                        value: val3,
                                        onChanged:  changed3
                                        ,label: "Rank",
                                        activeColor: Colors.blue,
                                        inactiveColor: Colors.grey,
                                      ),


                                    ),
                                    Expanded(
                                      child: Text(
                                        Message3,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black))
                          )
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Question Text",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[

                                    Container(

                                      width: 280,


                                      child:  new Slider(
                                        divisions: 10 ,
                                        max: 5,
                                        min: 0,
                                        value: val4,
                                        onChanged:  changed4
                                        ,label: "Rank",
                                        activeColor: Colors.blue,
                                        inactiveColor: Colors.grey,
                                      ),


                                    ),
                                    Expanded(
                                      child: Text(
                                        Message4,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black))
                          )
                      ),
                      Container(
                        width: 50,
                        padding: EdgeInsets.only(top: 10),
                        child: new TextField(
                          keyboardAppearance: Brightness.dark,
                          scrollPadding: EdgeInsets.all(10.0),
                          decoration: InputDecoration(
                            labelText: "Price :  LE",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          style: new TextStyle(color: Colors.amber),
                          autocorrect: true,
                          textAlign: TextAlign.center,
                          enableInteractiveSelection: true,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Comments:",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text("Behaviour",),
                             TextField(
                        keyboardAppearance: Brightness.dark,
                        scrollPadding: EdgeInsets.all(10.0),
                        decoration: InputDecoration(
                          labelText: "Behaviour",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        style: new TextStyle(color: Colors.amber),
                        autocorrect: true,
                        textAlign: TextAlign.center,
                        enableInteractiveSelection: true,
                      ),

                            Padding(padding: EdgeInsets.all(5)),

                            Text("Waiting Time",),
                            TextField(
                              keyboardAppearance: Brightness.dark,
                              scrollPadding: EdgeInsets.all(10.0),
                              decoration: InputDecoration(
                                labelText: "Waiting Time",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              style: new TextStyle(color: Colors.amber),
                              autocorrect: true,
                              textAlign: TextAlign.center,
                              enableInteractiveSelection: true,
                            ),

                            Padding(padding: EdgeInsets.all(5)),

                            ],
                        ),
                      ),




                    ],
                  ),
                )
              ],
            ),
          ),
        ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListOfDoctors()),
          ),
          tooltip: 'Done',
          child: Icon(Icons.person_add)
      ), // This trai
    );
  }
}
