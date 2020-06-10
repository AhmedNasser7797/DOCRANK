import 'dart:io';
import 'package:toast/toast.dart';
import 'package:final1/loading.dart';
import 'package:final1/search_page.dart';
import 'package:final1/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final1/auth.dart';


class SignIn extends StatefulWidget {
  SignIn({this.auth ,this.onSignIn});
  final BaseAuth auth;
final VoidCallback onSignIn;
  @override
  _SignInState createState() => _SignInState();

}
enum FormType{
  login,
  register
}
class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> formState =GlobalKey<FormState>();

  var _passKey = GlobalKey<FormFieldState>();
   var _emailKey= GlobalKey<FormFieldState>();
  String _errorText = "";
   String _passwordController ,emailController;

  String accountStatus = '******';
  FirebaseUser mCurrentUser;
  FirebaseAuth _auth;
  bool validatedateSave(){
    final form =formState.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;

  }

void validateAndSubmit()async {
  if(validatedateSave()){
    try{if(true)
      String userId = await widget.auth.signInWithEmailAndPassword(emailController,
          _passwordController );
    } catch (e){}
  }
}
  _submit() async {
    final formdata=formState.currentState;
    if(formState.currentState.validate()){
     
      print(emailController);
      print(_passwordController);
    //  print(await FirebaseDar);
      print(formState.currentState.validate());
      try {
        // start Loading
        Loading().loading(context);

        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController, password: _passwordController);

        // stop Loading
        Navigator.of(context).pop();

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Search()));
      } on
      PlatformException
      catch (e) {
        print("PlatformException**********");
        // stop Loading
        Navigator.of(context).pop(); // pop Loading Dialog
        _errorText = e.message;
      } on SocketException
      catch (e) {
        print("SocketException**********");
        Navigator.of(context).pop(); // pop Loading Dialog
        _errorText = e.message;
      }
      catch (e) {
        print("error**********");
        Navigator.of(context).pop(); // pop Loading Dialog
        _errorText = e.toString();
      }
      finally {
        // rebuild state if exist;
        print("final**********");
        widget.onSignIn();
        if (mounted) setState(() {});
      }
    }
      //if (mounted) setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formState,
        child: ListView(

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
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                "Email",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(
                      Icons.person_outline,
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
                    child: TextFormField(
                      key: _emailKey,
                      onSaved: (val){   setState(() {

                       emailController=val;});},

                      validator: (val){
                        if(val.isEmpty){
                          return"please Enter your Email";
                        }else{
                           emailController=_emailKey.currentState.value;
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                "Password",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(
                      Icons.lock_open,
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
                    child: TextFormField(
                      key: _passKey,
                      validator: (val){
                        if(val.isEmpty){

                          return"please Enter your Email";

                        }
                        else{
                          _passwordController=_passKey.currentState.value;
                        }
                      },
                      obscureText: true,

                      onSaved:(val) =>_passwordController =val,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "$_errorText",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        splashColor: Colors.blue,
                        color: Colors.blue,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Transform.translate(
                              offset: Offset(10.0, 0.0),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0)),
                                  splashColor: Colors.white,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () => _submit(),
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          _submit();
                        //  print("##############################");
                        //  print("$_passwordController+###########");
                          showToast("Show Center Toast $mCurrentUser.uid",
                              gravity: Toast.BOTTOM);
                         // print("Show Center Toast $mCurrentUser.uid");
                        }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0),
                        alignment: Alignment.center,
                        child: Text(
                          "DON'T HAVE AN ACCOUNT?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUp()),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
