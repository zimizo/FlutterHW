import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_7/utils.dart';

class HomeWorkSeven extends StatefulWidget {
  static const routeName = '/';
  const HomeWorkSeven({Key? key}) : super(key: key);
  @override
  State<HomeWorkSeven> createState() => _HomeWorkSevenState();
}

class _HomeWorkSevenState extends State<HomeWorkSeven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}

class Artists extends StatefulWidget {
  static const routeName = '/artists';
  const Artists({Key? key}) : super(key: key);

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  late List artists;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavDrawer(),
      body: FutureBuilder(
        future: getArtistList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['name']),
                    onTap: () {
                      Navigator.of(context).pushNamed('/artists_details', arguments: {'link': snapshot.data[index]['link']});
                    },
                    shape: const Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromARGB(115, 138, 135, 135),
                      ),
                    ),
                  );
                },
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class ArtistsDetails extends StatefulWidget {
  static const routeName = '/artists_details';
  const ArtistsDetails({Key? key, required this.link}) : super(key: key);
  final String link;
  @override
  State<ArtistsDetails> createState() => _ArtistsDetailsState();
}

class _ArtistsDetailsState extends State<ArtistsDetails> {
  late Future<Map<String, dynamic>> data;
  @override
  void initState() {
    data = getArtistByLink(widget.link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  snapshot.data['name'],
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      snapshot.data['about'],
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            );
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Страница не найдена!'),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pop();
             Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
          ListTile(
            title: const Text("Performers"),
            leading: const Icon(Icons.star),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamedAndRemoveUntil('/artists', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
