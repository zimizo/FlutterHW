import 'package:flutter/material.dart';

AssetImage getAssetImage(name) {
  try {
    final res = AssetImage("assets/images/space/$name");
    return res;
  } catch (e) {
    return const AssetImage("assets/images/default.jpg");
  }
}