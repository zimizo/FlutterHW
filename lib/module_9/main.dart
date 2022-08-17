import 'package:flutter/material.dart';

import 'package:flutter_home_work/module_9/holel_list_page.dart';
import 'package:flutter_home_work/module_9/hotel_details_page.dart';
import 'package:flutter_home_work/module_9/not_found_page.dart';

void main() {
  runApp(const MyApp());
}

MaterialPageRoute notFoundRoute() {
  return MaterialPageRoute(builder: (BuildContext context) {
    return const NotFound();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HotelListPage(),
        // initialRoute: '/hotel_list',
        onUnknownRoute: (RouteSettings settings) {
          return notFoundRoute();
        },
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HotelListPage.routeName:
              return MaterialPageRoute(builder: (BuildContext context) {
                return const HotelListPage();
              });
            case HotelDetailsPage.routeName:
              final args = settings.arguments as Map<String, dynamic>;
              if (args.containsKey('uuid')) {
                return MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return HotelDetailsPage(
                      uuid: args['uuid'],
                    );
                  },
                );
              }
              return notFoundRoute();
          }
          return notFoundRoute();
        });
  }
}
