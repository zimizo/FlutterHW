import 'package:flutter/material.dart';
// import 'package:flutter_home_work/exercise_1.dart';
// import 'package:flutter_home_work/exercise_2.dart';
// import 'package:flutter_home_work/exercise_3.dart';
import 'package:flutter_home_work/exercise_4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ExerciseOne(),
      home: const ExerciseFour(),
    );
  }
}

