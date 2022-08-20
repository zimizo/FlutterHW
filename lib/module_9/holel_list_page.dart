import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_9/models/hotel.dart';
import 'package:flutter_home_work/module_9/utils.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({Key? key}) : super(key: key);
  static const routeName = '/hotel_list';

  @override
  State<HotelListPage> createState() => _HotelListPageState();
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
              return showList
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardForList(
                          uuid: snapshot.data[index].uuid,
                          name: snapshot.data[index].name,
                          poster: snapshot.data[index].poster,
                        );
                      },
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardForTile(
                          uuid: snapshot.data[index].uuid,
                          name: snapshot.data[index].name,
                          poster: snapshot.data[index].poster,
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
                  color: Colors.grey,
                  image: DecorationImage(
                    image: getAssetImage(poster),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                  title: Text(name),
                  trailing: ElevatedButton(
                      onPressed: (() {
                        Navigator.of(context).pushNamed('/hotel_details',
                            arguments: {'uuid': uuid});
                      }),
                      child: const Text('Подробнее')),
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
  final String uuid;
  final String name;
  final String poster;
  const CardForTile(
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
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: getAssetImage(poster),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 2,
                  left: 2,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/hotel_details', arguments: {'uuid': uuid});
                },
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Подробнее',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
