import 'package:flutter/material.dart';

class ExerciseOne extends StatefulWidget {
  const ExerciseOne({Key? key}) : super(key: key);

  @override
  State<ExerciseOne> createState() => _ExerciseOneState();
}

class listItem {
  String title;
  listItem(this.title);
}

class _ExerciseOneState extends State<ExerciseOne>
    with TickerProviderStateMixin {
  final List<String> nav = ['Галерея', 'Мои фото'];
  List<Widget> itemsList = List<Widget>.generate(
      200,
      (i) => ListTile(
            title: Text('Item $i'),
            onTap: () {},
            shape: const Border(
              bottom: BorderSide(
                width: 1,
                color: Color.fromARGB(115, 138, 135, 135),
              ),
            ),
          ));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [for (final item in itemsList) item],
            ),
          ),
        ],
      ),
    );
  }
}
