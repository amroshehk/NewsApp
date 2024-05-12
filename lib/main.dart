import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layouts/news_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
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
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 70,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange),

      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 70,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange),
        iconTheme: IconThemeData(color: Colors.deepOrange),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewsLayout(),
    );
  }
}
