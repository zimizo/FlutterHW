import 'package:flutter/material.dart';

class ExerciseOne extends StatelessWidget {
  const ExerciseOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 200,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                  onTap: () {},
                  shape: const Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromARGB(115, 138, 135, 135),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
