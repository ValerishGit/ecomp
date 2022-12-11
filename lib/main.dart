import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/utils/const_values.dart';
import 'package:playground/views/home_screen.dart';

import 'controllers/search_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SearchController _searchController = Get.put(SearchController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      debugShowCheckedModeBanner: false,
      theme: Globals.themeData,
      home: HomeScreen(),
    );
  }
}
