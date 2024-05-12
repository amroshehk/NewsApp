

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() => ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    iconTheme: IconThemeData(color: Colors.deepOrange),),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 70,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange),
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);


ThemeData darkTheme() => ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    color: Colors.black87,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light),
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    iconTheme: IconThemeData(color: Colors.deepOrange),),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 70,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange),

);
