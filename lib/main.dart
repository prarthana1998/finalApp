
import 'package:flutter/material.dart';
import 'Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app',
      theme: ThemeData(
        // scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.black,
        // textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),

      ),
      home: Dashboard(),
    );
  }
}