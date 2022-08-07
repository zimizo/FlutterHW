import 'package:flutter/services.dart';
import 'dart:convert';

Future<String> fetchFileFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath).then((file) => file);
}

List getArtistList() {
  final response = fetchFileFromAssets('assets/sources/artists.json')
      .then((responce) => responce);
  final data = json.decode(response.toString());
  return List.generate(data.length, (index) => data[index]['link']);
}

class Artist {
  final name;
  final link;
  final about;

  Artist(this.name, this.link, this.about);
}

Artist getArtistByLink(String link) {
  final response = fetchFileFromAssets('assets/sources/artists.json')
      .then((responce) => responce) ;
  final data = json.decode(response.toString());
  for (final artist in data) {
    if (artist['link'] == link) {
      return Artist(artist['name'], artist['link'], artist['about']);
    }
  }
  return Artist('Not found', 'Not found', 'Not found');
}
