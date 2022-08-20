import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable()
class HotelMin {
  final String uuid;
  final String name;
  final String poster;

  HotelMin(this.uuid, this.name, {this.poster = 'default.jpg'});

  factory HotelMin.fromJson(Map<String, dynamic> json) => _$HotelMinFromJson(json);
  Map<String, dynamic> toJson() => _$HotelMinToJson(this);
}

@JsonSerializable()
class Hotel {
  final String uuid;
  final String name;
  final String poster;
  final Address address;
  final double price;
  final double rating;
  final HotelServices services;
  final List<String> photos;

  Hotel(this.uuid, this.name, this.poster, this.address, this.price,
      this.rating, this.services, this.photos);

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable()
class Address {
  final String country;
  final String city;
  final String street;
  @JsonKey(name: 'zip_code')
  final int zipCode;
  final Coords coords;

  Address(this.country, this.city, this.street, this.zipCode, this.coords);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Coords {
  final double lat;
  final double lan;

  Coords(this.lat, this.lan);

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

@JsonSerializable()
class HotelServices {
  final List<String> free;
  final List<String> paid;

  HotelServices(this.free, this.paid);

  factory HotelServices.fromJson(Map<String, dynamic> json) => _$HotelServicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}
