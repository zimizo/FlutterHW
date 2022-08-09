import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((file) => file);
}

Future<List<Map<String, dynamic>>> getArtistList() async {
  final response = await fetchFileFromAssets('assets/sources/artists.json')
      .then((responce) => responce);
  final data = json.decode(response.toString());

  final completer = Completer<List<Map<String, dynamic>>>();

  completer.complete(List.generate(
      data.length,
      (index) => {
            'link': data[index]['link'],
            'name': data[index]['name'],
          }));

  return completer.future;
}

Future<Map<String, dynamic>> getArtistByLink(String link) async {
  final response = await fetchFileFromAssets('assets/sources/artists.json')
      .then((responce) => responce);
  final data = json.decode(response.toString());

  final completer = Completer<Map<String, dynamic>>();

  for (final artist in data) {
    if (artist['link'] == link) {
      completer.complete({
        'name': artist['name'],
        'link': artist['link'],
        'about': artist['about'],
      });
      return completer.future;
    }
  }

  completer.complete({
        'name': 'Not found!',
        'link': 'Not found!',
        'about': 'Not found!',
      });
  return completer.future;
}
