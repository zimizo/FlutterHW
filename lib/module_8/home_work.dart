import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_home_work/module_8/utils.dart';

class SearchFile extends StatefulWidget {
  const SearchFile({Key? key}) : super(key: key);

  @override
  State<SearchFile> createState() => _SearchFileState();
}

class _SearchFileState extends State<SearchFile> {
  final textFieldController = TextEditingController();

  Future<String>? textFromFile;

  void readFile(String fileName) {
    if (!fileName.endsWith('.txt')) {
      fileName += '.txt';
    }
    setState(() {
      textFromFile = fetchFileFromAssets('assets/text_files/$fileName');
    });
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search File'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        readFile(textFieldController.text);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        height: 60,
                        width: 100,
                        child: const Center(
                          child: Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    label: const Text(
                      "Поиск",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
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
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FutureBuilder(
                    key: const Key('lioadFile'),
                    future: textFromFile,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return const Text('File not found!');
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case ConnectionState.none:
                          return Container();
                        case ConnectionState.done:
                          return Text(
                            snapshot.data.toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          );
                        default:
                          return Container();
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
