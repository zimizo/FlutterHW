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

class Artist {
  final String name;
  final String link;
  final String about;

  Artist(this.name, this.link, this.about);
}

Future<Artist> getArtistByLink(String link) async {
  final response = await fetchFileFromAssets('assets/sources/artists.json')
      .then((responce) => responce);
  final data = json.decode(response.toString());

  final completer = Completer<Artist>();

  for (final artist in data) {
    if (artist['link'] == link) {
      completer
          .complete(Artist(artist['name'], artist['link'], artist['about']));
      return completer.future;
    }
  }

  completer.complete(Artist('Not found', 'Not found', 'Not found'));
  return completer.future;
}
