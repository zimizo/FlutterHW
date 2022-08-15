import 'package:flutter/material.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({Key? key, required this.uuid}) : super(key: key);
  static const routeName = '/hotel_details';
  final String uuid;

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}