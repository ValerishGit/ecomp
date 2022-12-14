// ignore_for_file: unused_field

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/auth_controller.dart';
import 'package:playground/utils/const_values.dart';
import 'package:playground/views/auth/login_screen.dart';
import 'package:playground/views/home_screen.dart';

import 'controllers/search_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SearchController _searchController = Get.put(SearchController());
  final AuthController _authController = Get.put(AuthController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Playground',
      debugShowCheckedModeBanner: false,
      theme: Globals.themeData,
      home: _authController.activeUser.value.token != ""
          ? HomeScreen()
          : LoginScreen(),
    );
  }
}
