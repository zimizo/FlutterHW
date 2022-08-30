import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_11/components/card.dart';
import 'package:flutter_home_work/module_11/data.dart';

class ListPage extends StatefulWidget {
  static const routeName = '/list';
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Space')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return SpaseCard(
            id: data[index]['id'],
            title: data[index]['title'],
            image: data[index]['image'],
          );
        },
      ),
    );
  }
}
