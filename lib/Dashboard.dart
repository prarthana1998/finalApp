

import 'package:flutter/material.dart';
import'pages/about-page.dart';
import'login/login_firstpage.dart';


class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:  new Drawer(
        child:Container(
          color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/etil.jpeg"),


                   //   fit: BoxFit.cover
                  )
              ),
              child: Text(""),
            ),
            ListTile(
              title: Text("About Us"),
//              onTap: (){
//                Navigator.of(context).pop();
//              },
    onTap: () {
    Navigator.push(
    context, MaterialPageRoute(builder: (context) => MyHomePage())
    );}
            ),
            ListTile(
              title: Text("Feedback"),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        ),
),
        appBar: AppBar(
          title: new Text('ETI Labs'),
          leading: IconButton(
            icon: Image.asset('assets/etil.jpeg'),),
          backgroundColor: Colors.black87,
          // centerTitle: true,

        ),
//drawer: new Drawer(
//  child:ListView(
//    children: <Widget>[
//      Text(
//       'About',
//       //"Feedback"
//      )
//    ],
//  )
//),
        body: new Container(
          //children: <Widget>[

            child: new Center(
              child: new Column(

                children: <Widget>[
                  buildButtonContainer2(context),     //about
                  new Row(
                    children: <Widget>[
                      buildButtonContainer3(context),//MQTT
                      buildButtonContainer6(context),//HTTP
                        //cloud computing
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      buildButtonContainer5(context),//Bluetooth
                      buildButtonContainer4(context), //cloud computing
                    //wifi
                    ],
                  ),
                //  buildButtonContainer7(context),        //feedback
                  SizedBox(height: 20),
                  //   )
                ],
              ),
            ))
    );
  }

  Widget buildButtonContainer2(BuildContext context) {
    return Container(
      height: 100.0,
      width: 500.0,
      padding: EdgeInsets.all(15),
      child: RaisedButton(

        color: Colors.blue,
        textColor: Colors.white,
        splashColor: Colors.blue[100],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())
          );
        },
        // padding:EdgeInsets.only(left:30),
        child: Text(
          'ABOUT',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget buildButtonContainer3(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      padding: EdgeInsets.all(15),
      // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: RaisedButton(

        color: Colors.blue,
        textColor: Colors.white,
        splashColor: Colors.blue[100],
        onPressed: () {
 Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage())
          );
        },
        // padding:EdgeInsets.only(left:30),
        child: Text(
          'MQTT Protocol',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

  Widget buildButtonContainer4(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      padding: EdgeInsets.all(15),
      // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: RaisedButton(

        color: Colors.blue,
        textColor: Colors.white,
        splashColor: Colors.blue[100],
        child: Text(
          'Cloud Computing',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        onPressed: () {
           Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage())
          );
        },
      ),
    );
  }

  Widget buildButtonContainer5(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      padding: EdgeInsets.all(15),
      // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: RaisedButton(

        color: Colors.blue,
        textColor: Colors.white,
        splashColor: Colors.blue[100],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage())
          );
        },
        child: Text(
          'Bluetooth',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

  Widget buildButtonContainer6(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      padding: EdgeInsets.all(15),
      // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: RaisedButton(

        color: Colors.blue,
        textColor: Colors.white,
        splashColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage())
          );
        },
        child: Text(
          'HTTP Protocol',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

//  Widget buildButtonContainer7(BuildContext context) {
//    return Container(
//      height: 100.0,
//      width: 500.0,
//      padding: EdgeInsets.all(15),
//      child: RaisedButton(
//
//        color: Colors.lightBlue,
//        textColor: Colors.white,
//        splashColor: Colors.lightBlue,
//        onPressed: () {
////          Navigator.push(
////              context, MaterialPageRoute(builder: (context) => MyHomePage())
////          );
//        },
//        child: Text(
//          'FEEDBACK',
//          style: TextStyle(
//            fontSize: 20.0,
//          ),
//        ),
//      ),
//    );
//  }

}