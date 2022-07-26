// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
      home: const MyHomePage(title: 'Sweets'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Image.asset('assets/images/image.jpg')
            // Image.network('https://storge.pic2.me/c/1360x800/639/55510c2d0710e.jpg')
            // SvgPicture.asset('assets/icons/coffee-svgrepo-com.svg')
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [
                'assets/icons/muffin-svgrepo-com.svg',
                'assets/icons/ice-cream-svgrepo-com.svg',
                'assets/icons/coffee-svgrepo-com.svg',
                'assets/icons/doughnut-svgrepo-com.svg',
                'assets/icons/sweats-svgrepo-com.svg'
                ].map((icon) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      // color: Colors.amber
                      ),
              child: SvgPicture.asset(
                icon
                )
            );
      },
    );
  }).toList(),)
            
          ],
        ),
      ),
    );
  }
}
