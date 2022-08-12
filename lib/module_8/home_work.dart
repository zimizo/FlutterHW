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
  final StreamController _readFileStreamController = StreamController<String>();
  late StreamSubscription subscription;
  String textFromFile = '';

  @override
  void initState() {
    subscription = _readFileStreamController.stream.listen(
      (fileName) async {
        if (!fileName.endsWith('.txt')) {
          fileName += '.txt';
        }
        String text = (await fetchFileFromAssets('assets/text_files/$fileName'))
            .toString();
        setState(() {
          textFromFile = text;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    textFieldController.dispose();
    subscription.cancel();
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
          padding: const EdgeInsets.all(
            15
          ),
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
                        setState(() {
                          _readFileStreamController
                              .add(textFieldController.text);
                        });
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
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                  textFromFile,
                  key: const Key('textKey'),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
