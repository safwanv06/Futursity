import 'package:flutter/material.dart';

import '../Model/TopCourse.dart';
import '../Services.dart';
import '../main.dart';
import 'Course.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    Course(),
    Center(child: Text('No Data')),
    Center(child: Text('No Data')),
    Center(child: Text('No Data'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined, color: Colors.grey),
              label: 'Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
              label: 'My Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.grey), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
              label: 'Account')
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
