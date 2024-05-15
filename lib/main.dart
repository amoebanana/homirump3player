import 'package:flutter/material.dart';
import 'package:homirump3player/screen/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xff1f212c),
      ),
      home: Home(),
    )
  );
}