import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/form.dart';
import 'screens/write_form.dart';

//void main() {runApp(MyApp());}

class MyThingspeak extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>MyHomePage(),
        '/home': (context) => MyHomePage(),
        '/form':(context)=>TestForm(),
        '/write_form':(context)=>WriteForm(),
      },
      initialRoute: '/',
    );
  }
}
