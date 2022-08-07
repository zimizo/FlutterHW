import 'package:flutter/material.dart';

class ExerciseFour extends StatelessWidget {
  const ExerciseFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              label: Text(
                "Поиск",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.purple,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.purple,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.purple,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Введите значение',
              helperText: 'Поле для поиска заметок',
              suffixIcon: Icon(
                Icons.search,
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
