

import 'package:flutter/material.dart';

// Package imports:
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_svg/flutter_svg.dart';


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
      home: const MyHomePage(title: 'hw_4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> nav = ['Галерея', 'Мои фото'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          tabs: nav.map((String tab) => Tab(text: tab)).toList()
          ),
      ),
      body: TabBarView(
        children: nav.map((name) {
          return ListView(
            key: PageStorageKey(name),
            children: <Widget>[
              for (int i = 23; i < 50; i++) Image.network('https://picsum.photos/id/$i/500/500'),
            ],
          );
        }).toList(),
        )
    ),
    );
  }
}
