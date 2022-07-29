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

final ButtonStyle buttonStyle = TextButton.styleFrom(
  backgroundColor: const Color.fromARGB(221, 144, 141, 141),
);

class _MyHomePageState extends State<MyHomePage> {
  final List<String> nav = ['Галерея', 'Мои фото'];
  List<String> numList = List<String>.generate(200, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home work 5'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('https://picsum.photos/300/300'),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Images'),
                    leading: Icon(Icons.image),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text('Выход'),
                      style: buttonStyle,
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: Text('Регистрация'),
                      style: buttonStyle,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
