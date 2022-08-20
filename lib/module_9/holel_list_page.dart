import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_9/models/hotel.dart';
import 'package:flutter_home_work/module_9/utils.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({Key? key}) : super(key: key);
  static const routeName = '/hotel_list';

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

AssetImage getAssetImage(name) {
  try {
    final res = AssetImage("assets/images/$name");
    return res;
  } catch (e) {
    return const AssetImage("assets/images/default.jpg");
  }
}

class _HotelListPageState extends State<HotelListPage> {
  late Future<List<HotelMin>> hotelList;
  bool showList = true;

  @override
  void initState() {
    hotelList = getHotelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отели'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  showList = !showList;
                });
              },
              icon: showList ? const Icon(Icons.apps) : const Icon(Icons.list)),
        ],
      ),
      body: FutureBuilder(
        future: hotelList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Icon(Icons.error),
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardForList(
                    uuid: snapshot.data[index].uuid,
                    name: snapshot.data[index].name,
                    // poster: snapshot.data[index].poster,
                    poster: 'image.jpg',
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

class CardForList extends StatelessWidget {
  final String uuid;
  final String name;
  final String poster;
  const CardForList(
      {Key? key, required this.uuid, required this.name, required this.poster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: const Color.fromARGB(255, 128, 57, 57),
                  image: DecorationImage(
                    image: getAssetImage(poster),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: null /* add child content here */,
              ),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                  title: Text(name),
                  trailing: ElevatedButton(
                      onPressed: (() {}), child: const Text('Подробнее')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardForTile extends StatelessWidget {
  const CardForTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
