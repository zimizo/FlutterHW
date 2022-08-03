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
      home: const MyHomePage(title: 'hw_5'),
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

class TabItem {
  String title;
  Icon icon;
  TabItem(this.title, this.icon);
}

final List<TabItem> _tabBar = [
  TabItem('Home', const Icon(Icons.home)),
  TabItem('Chat', const Icon(Icons.message)),
  TabItem('Albums', const Icon(Icons.album)),
];

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _currentTabIndex = 0;

  final List<String> nav = ['Галерея', 'Мои фото'];
  List<String> numList = List<String>.generate(200, (i) => 'Item $i');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home work 5'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.person),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('https://picsum.photos/300/300'),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Home'),
                    leading: const Icon(Icons.home),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Profile'),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Images'),
                    leading: const Icon(Icons.image),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: const Text('Выход'),
                  ),
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: const Text('Регистрация'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DrawerHeader(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('https://picsum.photos/400/400'),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.teal,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          elevation: 0,
          items: [
            for (final item in _tabBar)
              BottomNavigationBarItem(icon: item.icon, label: item.title)
          ],
          currentIndex: _currentTabIndex,
          onTap: (index) {
            setState(() {
              _tabController.index = index;
              _currentTabIndex = index;
            });
          },
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListTile(
                              title: const Text('Images'),
                              leading: const Icon(Icons.image),
                              trailing: const Text('200 руб'),
                              onTap: () {},
                            ),
                            ElevatedButton(
                                child: const Text('Confirm'),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
