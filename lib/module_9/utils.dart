import 'dart:async';

import 'package:flutter_home_work/module_9/models/hotel.dart';
import 'package:dio/dio.dart';

String hotelListUrl =
    'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301/';
String hotelUrl = 'https://run.mocky.io/v3/';

final _dio = Dio();

Future<List<HotelMin>> getHotelList() async {
  try {
    var response = await _dio.get(hotelListUrl);

    final completer = Completer<List<HotelMin>>();

    completer.complete(
      List.generate(
        response.data.length,
        (index) => HotelMin.fromJson(response.data[index]),
      ),
    );

    return completer.future;
  } catch (e) {
    throw Exception('Ошибка загрузки данных!');
  }
}

Future<Hotel> getHotel(String uuid) async {
  try {
    var response = await _dio.get(hotelUrl + uuid);

    final completer = Completer<Hotel>();

    completer.complete(Hotel.fromJson(response.data));

    return completer.future;
  } catch (e) {
    throw Exception('Ошибка загрузки данных!');
  }
}
