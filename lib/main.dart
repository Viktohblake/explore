import 'package:explore/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
        },
        theme: new ThemeData(
            primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'redhatdisplay'),
      );
  }
}
