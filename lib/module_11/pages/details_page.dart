import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> space;
  static const routeName = '/details';

  const DetailsPage({
    Key? key,
    required this.space,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(space['title']),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Hero(
                tag: space['id'],
                child: Image.asset('assets/images/space/${space['image']}'),
              ),
              Positioned(
                bottom: -30,
                right: 30,
                child: Hero(
                  tag: '${space['id']}-button',
                  child: Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(15),
                    child: const Icon(Icons.play_arrow),
                  ),
                ),
              ),
            ],
          ),
        ),
        Hero(
          tag: '${space['id']}-title',
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              child: Text(
                space['title'],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
