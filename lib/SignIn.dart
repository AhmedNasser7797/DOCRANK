import 'package:flutter/material.dart';
import './signUp.dart';
import './search.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
        Text("Sign In") ,centerTitle: true,

      ),

      body: new Container(
        alignment: Alignment.topCenter,

        child: new Container(
          padding: const EdgeInsets.only(
              right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/ss.jpg"),
              fit: BoxFit.cover,
            ),
          ),


         child: ListView(

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

             Container(
                 height: 50,
                 margin: const EdgeInsets.only(top:20.0,left: 10.0,right: 10.0, bottom: 30.0),
                 child: new ListTile(
                   leading: const Icon(Icons.person),
                   title: new TextField(
                     decoration: new InputDecoration(
                       hintText: "User Name",
                       border: InputBorder.none,
                     ),
                   ),
                 ),
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: new BorderRadius.circular(30.0),
                     border: Border.all(color: Colors.blue, width: 3))
             ),

             Container(
                 height: 50,
                 margin: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 30.0),
                 child: new ListTile(
                   leading: const Icon(Icons.phone_iphone),
                   title: new TextField(
                     decoration: new InputDecoration(
                       hintText: "password",
                       border: InputBorder.none,
                     ),
                   ),
                 ),
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: new BorderRadius.circular(30.0),
                     border: Border.all(color: Colors.blue, width: 3)
                 )
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Container(
                   alignment: Alignment.center,
                   child: new InkWell(
                     child: Text(
                       "Have no account?  ",
                       style: TextStyle(color: Colors.black),
                     ),
                     highlightColor: Colors.white,
                     splashColor: Colors.white,
                     onTap: () => Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => SignUp()),
                     ),
                   ),
                 ),

                 Container(
                   alignment: Alignment.center,
                   child: new InkWell(
                     child: Text(
                       "Sign up here",
                       style: TextStyle(color: Colors.blue),
                     ),
                     highlightColor: Colors.white,
                     splashColor: Colors.white,
                     onTap: () => Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => SignUp()),
                     ),
                   ),
                 ),

               ],
             ),



              Padding(padding: EdgeInsets.only(top: 40)),

              Row(
                children: <Widget>[

                  new RaisedButton(
                    padding: const EdgeInsets.all(16.0),
                    textColor: Colors.blue,
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text("Back"),
                  ),

                  Padding(padding: EdgeInsets.only(left: 160)),

                  new RaisedButton(
                    onPressed: () =>Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => search()),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text(
                      "Sign In",
                    ),
                  ),


                ],
              )



           ],
         ),





            ),




            ),







    );
  }
}
