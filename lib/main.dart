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
      home: MyHomePage(title: 'hw_5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
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
  TabItem('Home', Icon(Icons.home)),
  TabItem('Chat', Icon(Icons.message)),
  TabItem('Albums', Icon(Icons.album)),
];

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List<String> nav = ['Галерея', 'Мои фото'];
  List<String> numList = List<String>.generate(200, (i) => 'Item $i');
  TabController? _tabController;
  bool _showBottomSheet = false;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _showBottomSheet = false;
    _tabController?.addListener(() {
      print('object');
      setState(() {
        if(_tabController != null) {
          _currentTabIndex = _tabController!.index;
        }
      });
    });
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
        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
            items: [
              for (final item in _tabBar)
                BottomNavigationBarItem(
                  icon: item.icon,
                  label: item.title
                )
            ],
            currentIndex: _currentTabIndex,
            onTap: (index){
              setState(() {
                _tabController?.index = index;
                _currentTabIndex = index;
              });
            },
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (!_showBottomSheet) {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text('Images'),
                            leading: Icon(Icons.image),
                            trailing: Text('200 руб'),
                            onTap: () {},
                          ),
                          ElevatedButton(
                              child: const Text('Confirm'),
                              onPressed: () {
                                Navigator.pop(context);
                                _showBottomSheet = false;
                              })
                        ],
                      ),
                    ),
                  );
                },
              );
              _showBottomSheet = true;
            } else {
              Navigator.pop(context);
              _showBottomSheet = false;
            }
          },
        ),
      ),
    );
  }
}
