import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'homePage.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/thingspeak/main.dart';
//import 'auth.dart'
import 'auth.dart';



class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  //bool Loading false;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final Authenticate _auth = Authenticate();
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading=false;
  String email = '';
  String password  ='';
  String error = '';

  final GlobalKey<FormState> _loginFormKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginFormKey2 = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController nameInputController;


  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    nameInputController=new TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 80.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            new Image(
//              image: new AssetImage("assest/hostel.png"),
//              height: 125.0,
//              width: 125.0,
//              ),

            SizedBox(height: 30.0,),

            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF21BFBD),
              ),
            ),

            SizedBox(height: 30.0,),
            buildTextField1("Email"),
            SizedBox(height: 20.0,),
            buildTextField2("Password"),
            SizedBox(height: 20.0,),
//            Container(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  Text(
//                    "Forgotten Password?",
//                    style: TextStyle(
//                      color: Theme.of(context).primaryColor,
//                    ),
//                  ),
//                ],
//              ),
//            ),
// SizedBox(height: 50.0),
            buildButtonContainer(),
            //     SizedBox(height: 30.0),

//            Text(
//              error,
//              style: TextStyle(color: Colors.red, fontSize: 14.0),
//              ),
            //     SizedBox(height: 20.0),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("New to ETI LABS?"),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RegisterPage() ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Color(0xFF21BFBD),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                    // Text("REGISTER", style: TextStyle(color: Theme.of(context).primaryColor,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField1(String hintText){     //for email part
    return Form(
        key: _loginFormKey1,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
//        prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
//        suffixIcon: hintText == "Password" ? IconButton(
//          onPressed: _toggleVisibility,
//          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
//        ) : null,
            prefixIcon: Icon(Icons.email),
          ),
          controller: emailInputController,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
          //  validator: (val) => val.isEmpty ? 'Enter an email' : null,

          onChanged: (val){
            setState(() => email = val);




          },
          //      obscureText: hintText == "Password" ? _isHidden : false,
        )
    );
  }

  Widget buildTextField2(String hintText){     //for password part
    return Form(
        key: _loginFormKey2,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            prefixIcon: Icon(Icons.lock),
            suffixIcon: hintText == "Password" ? IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            ) : null,

          ),
          controller: pwdInputController,
          obscureText: true,
          validator: pwdValidator,
          //validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
          //obscureText: hintText == "Password" ? _isHidden : false,


          onChanged: (val) {
            setState(() => password = val);




          },
        ));
  }

  Widget buildButtonContainer(){
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(
            colors: [
              Color(0xFF21BFBD),
              Color(0xFF7A9BEE)
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
        ),
      ),


      child: Center(

        child:InkWell(
          onTap: () async {

            if (_loginFormKey1.currentState.validate()&&_loginFormKey2.currentState.validate()) {


//              //  _createUser(email: email, pw: password);
              //setState(() =>loading=true);
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Alert"),
//                       content: Text("Login Successful!!"),
//                       actions: <Widget>[
//                         FlatButton(
//                           child: Text("OK"),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         )
//                       ],
//                     );
//                   });
              FirebaseAuth.instance
                  .signInWithEmailAndPassword( email: emailInputController.text,password: pwdInputController.text)
                  .then((currentUser) => Firestore.instance
                  .collection("locs")
                  .document(currentUser.user.uid)
                  .get()
                  .then((DocumentSnapshot result) =>
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                            uid: currentUser.user.uid,
                          ))))
                  .catchError((err) => print(err)))
                  .catchError((err) => print(err));
//                showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Alert"),
//                       content: Text(""),
//                       actions: <Widget>[
//                         FlatButton(
//                           child: Text("OK"),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         )
//                       ],
//                     );
//                   });



              dynamic result = await _auth.signInWithEmailAndPassword(email, password);
              if(result == null) {
                setState(() {
                  // loading=false;
                  error = 'Could not sign in with those credentials';
//        showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Alert"),
//                       content: Text("hhhhh"),
//                       actions: <Widget>[
//                         FlatButton(
//                           child: Text("OK"),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         )
//                       ],
//                     );
//                   });
                }
                );
              }         }
          },

          child: Text(
            "Login Here",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),

        ),



      ),

    );

  }

}



