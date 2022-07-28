import 'package:flutter/material.dart';

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
  List<String> numList = List<String>.generate(200, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom:
                TabBar(tabs: nav.map((String tab) => Tab(text: tab)).toList()),
          ),
          body: TabBarView(
            children: nav.map((name) {
              return ListView.builder(
                key: PageStorageKey(name),
                itemCount: numList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    height: 400,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 144, 143, 141),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://picsum.photos/id/$index/500/500',
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          )),
    );
  }
}
