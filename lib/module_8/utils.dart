import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';

Future<String> fetchFileFromAssets(String assetsPath) async {
  try {
    return await rootBundle.loadString(assetsPath).then((file) => file);
  } 
  on FlutterError{
    return 'File not found!';
  }
  catch (e) {
    return("Error: $e");
  }
}
