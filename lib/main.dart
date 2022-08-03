import 'package:flutter/material.dart';
import 'package:flutter_hoome_works/exercise_1.dart';
import 'package:flutter_hoome_works/exercise_2.dart';

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
      home: const ExerciseTwo(),
    );
  }
}

