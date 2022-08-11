import 'package:flutter/material.dart';

import 'package:flutter_home_work/module_7/home_work.dart';

void main() {
  runApp(const MyApp());
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
      home: const HomeWorkSeven(),
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return const NotFound();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomeWorkSeven.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const HomeWorkSeven();
            });
          case Artists.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const Artists();
            });
          case ArtistsDetails.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            if (args.containsKey('link')) {
              return MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) {
                  return ArtistsDetails(
                    link: args['link'],
                  );
                },
              );
            }
            return MaterialPageRoute(builder: (BuildContext context) {
              return const NotFound();
            });
        }
        return MaterialPageRoute(builder: (BuildContext context) {
          return const NotFound();
        });
      },
    );
  }
}
