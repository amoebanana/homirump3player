import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homirump3player/screen/home.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xff1f212c),
      ),
      home: Home(),
    )
  );
}
