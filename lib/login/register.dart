import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homePage.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool loading=false;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  TextEditingController nameInputController;
  TextEditingController pnoInputController;
  // TextEditingController branchInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    nameInputController=new TextEditingController();
    pnoInputController=new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }
  String confirmPwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }
  String nameValidator(String value) {
//    Pattern pattern =
//        r'^(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//    RegExp regex = new RegExp(pattern);
    if (value.length<3) {
      return 'Name format is invalid';
    } else {
      return null;
    }
  }

  String pnoValidator(String value) {

    // RegExp regex = new RegExp(pattern);
    if (value.length<10||value.length>10) {
      return 'Enter a valid Phone Number';
    } else {
      return null;
    }
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Container(
          //padding: EdgeInsets.only(top: 15.0, left: 40.0, right: 25.0),
            padding:EdgeInsets.all(40.0),
            child: SingleChildScrollView(

                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:40,width:40),
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                                color: Colors.blue
                        ),
                      ),
                      SizedBox(height:20),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan))),
                        controller: nameInputController,
                        //   keyboardType: TextInputType.name,
                        validator: nameValidator,

                      ),
                      SizedBox(height:20),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan))),
                        controller: pnoInputController,
                        //  keyboardType: TextInputType.emailAddress,
                        validator: pnoValidator,
                      ),
                      SizedBox(height:20),


                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan))),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),

                      SizedBox(height:20),
//                      TextFormField(
//                        decoration: InputDecoration(
//                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                            hintText: "Password",
//                            fillColor: Colors.white,
//                            border:
//                            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan))),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      SizedBox(height:20),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan))),
                        controller: confirmPwdInputController,
                        obscureText: true,
                        validator:confirmPwdValidator,
                      ),
                      //  SizedBox(height:20),
                      SizedBox(height:40),
//                      RaisedButton(
//                        child: Text(
//                            "Register",
//                            style: TextStyle(
//                            color: Colors.white,
//                            fontWeight: FontWeight.bold,
//                            fontFamily: 'Montserrat'),
//                            ),
//                      //  color: Theme.of(context).primaryColor,
//                        //textColor: Colors.white,
                      RaisedButton(
                        color: Color(0xFF21BFBD),
                        textColor: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Register", style: TextStyle(fontSize: 24.0)),

                              ],
                            )),


                        onPressed: () {
                          if (_registerFormKey.currentState.validate()) {
                            if (pwdInputController.text ==
                                confirmPwdInputController.text) {
                              setState(() =>loading=true);
                              FirebaseAuth.instance

                                  .createUserWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text,
                                // name:nameInputController.text,
                                // name:nameController.text
                              )
                                  .then((currentUser) => Firestore.instance
                                  .collection("data")
                                  .document(currentUser.user.uid)
                                  .setData({
                                "email": emailInputController.text,
                                "name":nameInputController.text,

                                "pno":pnoInputController.text,

                              })
//                                  .setData({
//                                          // "email": emailInputController.text;
//                                           "name":nameController.text
//                                           })
                                  .then((result) => {
//                                Navigator.pushAndRemoveUntil(
//                                    context,
//                                    // ignore: sdk_version_set_literal
//                                    MaterialPageRoute(
//                                        builder: (context) => HomePage(
//
//                                          uid: currentUser.user.uid, // ignore: sdk_version_set_literal
//                                          )),
//                                        (_) => false),
                                emailInputController.clear(),
                                pwdInputController.clear(),
                                confirmPwdInputController.clear(),
                                nameInputController.clear(),

                                pnoInputController.clear()
                              })
                                  .catchError((err) => print(err)))
                                  .catchError((err) => print(err));
                              setState(() =>loading=false);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Alert"),
                                      content: Text("Registered Successfully!"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text("The passwords do not match"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                      ),
                      Text("Already have an account?"),
                      FlatButton(
                        child: Text("Login here!"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height:100),
                    ],
                  ),
                )))
    );
  }
}
