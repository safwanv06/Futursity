import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trogonmachinetest/Services.dart';
import 'package:trogonmachinetest/Model/TopCourse.dart';

import 'View/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}




