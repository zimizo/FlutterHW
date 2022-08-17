import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';

Future<String> fetchFileFromAssets(String assetsPath) async {
  await Future.delayed(const Duration(seconds: 2));
  try {
    return await rootBundle.loadString(assetsPath).then((file) => file);
  } on FlutterError {
    throw Exception('File not found!');
  } catch (e) {
    return ("Error: $e");
  }
}
