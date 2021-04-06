import 'package:flutter/material.dart';


ThemeData appTheme = ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
         textTheme: TextTheme(
      headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
      headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),
      bodyText1: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,color: Colors.white),
      bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold,),
      caption: TextStyle(fontSize: 24.0, color: Color(0xff222222), fontWeight: FontWeight.bold,),
    ),);