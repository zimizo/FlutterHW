import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_7/utils.dart';

class HomeWorkSeven extends StatefulWidget {
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
  const Artists({Key? key}) : super(key: key);

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  late List artists;

  @override
  void initState() {
    super.initState();
    artists = getArtistList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavDrawer(),
      body: ListView.builder(
        itemCount: artists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(artists[index]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ArtistsDetails(artists[index])));
            },
            shape: const Border(
              bottom: BorderSide(
                width: 1,
                color: Color.fromARGB(115, 138, 135, 135),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArtistsDetails extends StatefulWidget {
  const ArtistsDetails(String link, {Key? key}) : super(key: key);

  @override
  State<ArtistsDetails> createState() => _ArtistsDetailsState();
}

class _ArtistsDetailsState extends State<ArtistsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HomeWorkSeven()));
            },
          ),
          ListTile(
            title: const Text("Performers"),
            leading: const Icon(Icons.star),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Artists()));
            },
          ),
        ],
      ),
    );
  }
}
