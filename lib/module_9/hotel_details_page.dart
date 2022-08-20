import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_9/models/hotel.dart';
import 'package:flutter_home_work/module_9/utils.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({Key? key, required this.uuid}) : super(key: key);
  static const routeName = '/hotel_details';
  final String uuid;

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  late Future<Hotel> hotel;
  @override
  void initState() {
    hotel = getHotel(widget.uuid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hotel,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Ошибка!'),
            ),
            body: const Center(child: Text("Контент временно не доступен!")),
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Загрузка...'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          case ConnectionState.done:
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data.name),
                leading: IconButton(icon: const Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pop();
                },),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: List.generate(
                        snapshot.data.photos.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: getAssetImage(
                                      snapshot.data.photos[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      options: CarouselOptions(
                        height: 250.0,
                        viewportFraction: 0.8,
                      ),
                    ),
                    DescriptionItemRichText(
                        label: 'Страна', value: snapshot.data.address.country),
                    DescriptionItemRichText(
                        label: 'Горрод', value: snapshot.data.address.city),
                    DescriptionItemRichText(
                        label: 'Улица', value: snapshot.data.address.street),
                    DescriptionItemRichText(
                        label: 'Рейтинг', value: '${snapshot.data.rating}'),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                      ),
                      child: Text(
                        'Сервисы',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServicesColumn(
                          header: 'Платные:',
                          items: snapshot.data.services.paid,
                        ),
                        ServicesColumn(
                          header: 'Бесплатные:',
                          items: snapshot.data.services.free,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

class DescriptionItemRichText extends StatelessWidget {
  const DescriptionItemRichText(
      {Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return value != ''
    ?RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        text: '$label: ',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    )
    : Container();
  }
}

class ServicesColumn extends StatelessWidget {
  const ServicesColumn({Key? key, required this.header, required this.items})
      : super(key: key);
  final String header;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              // fontWeight: FontWeight.bold,
            ),
          ),
          ...List.generate(items.length, (index) {
            return Text(
              '- ${items[index]}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            );
          })
        ],
      ),
    );
  }
}
