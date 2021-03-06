import 'package:flutter/material.dart';
import 'package:flutter_food_app/Home/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
    );
  }
}


