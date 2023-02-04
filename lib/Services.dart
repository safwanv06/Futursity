import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trogonmachinetest/Model/Categories.dart';
import 'package:trogonmachinetest/Model/TopCourse.dart';

class Api{
  static List? topCourses;
  static List? categories;
  static int a=1;

  static topCourse()async{
    Response response=await get(Uri.parse('https://futursity.com/course/api/top_courses'));
    topCourses=topCoursesFromJson(response.body);
    print(topCourses);
  }
  static categorie()async{
    Response response=await get(Uri.parse('https://futursity.com/course/api/categories'));
    categories=categoriesFromJson(response.body);
    print(categories);
  }
  static clr() {
    if (a == 1) {
      a = 2;
      return  Colors.red;
    } else if (a == 2) {
      a = 3;
      return  Colors.blue;
    } else if (a == 3) {
      a = 4;
      return  Colors.pink;
    }
    else if(a==4){
      a=1;
      return  Colors.orange;
    }
  }
}