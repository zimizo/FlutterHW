import 'package:flutter/material.dart';



import 'package:flutter_home_work/module_11/pages/list_page.dart';
import 'package:flutter_home_work/module_11/pages/details_page.dart';
import 'package:flutter_home_work/module_11/pages/not_found_page.dart';


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
        home: ListPage(),
        // initialRoute: '/hotel_list',
        onUnknownRoute: (RouteSettings settings) {
          return notFoundRoute();
        },
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case ListPage.routeName:
              return MaterialPageRoute(builder: (BuildContext context) {
                return ListPage();
              });
            case DetailsPage.routeName:
              final args = settings.arguments as Map<String, dynamic>;
              if (args.containsKey('id')) {
                return MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return DetailsPage(
                      id: args['id'],
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
