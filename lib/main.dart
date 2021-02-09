import 'package:flutter/material.dart';

import './screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Super Superheroes',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal[500],
          accentColor: const Color(0xFF2A3542),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            height: 45,
            buttonColor: Colors.teal[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            textTheme: ButtonTextTheme.accent,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black.withAlpha(180),
            ),
            subtitle1: TextStyle(color: Colors.black.withAlpha(140)),
            subtitle2: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black.withAlpha(140),
            ),
          ),
        ),
        home: Home(),
      );
}
