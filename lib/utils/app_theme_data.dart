import 'package:flutter/material.dart';

ThemeData appthemeData(){
  return ThemeData(
        primaryColorLight: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              headlineLarge: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
              displayLarge: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'ELMessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(color: Colors.blue, centerTitle: true),
      );
}