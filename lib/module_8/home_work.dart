import 'package:flutter/material.dart';
import 'package:text_field_suffix_button/text_field_suffix_button.dart';

void function() {}

class SearchFile extends StatefulWidget {
  SearchFile({Key? key}) : super(key: key);

  @override
  State<SearchFile> createState() => _SearchFileState();
}

class _SearchFileState extends State<SearchFile> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search File'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 5,
            right: 5,
            bottom: 5,
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                
                onPressed: () {},
                icon: Container(width: 200,
                height: 200,
                color: Colors.black,)
              ),
              label: Text(
                "Поиск",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Введите имя файла',
            ),
          ),
        ),
      ),
    );
  }
}
