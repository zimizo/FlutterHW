// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelMin _$HotelMinFromJson(Map<String, dynamic> json) => HotelMin(
      json['uuid'] as String,
      json['name'] as String,
      poster: json['poster'] as String? ?? 'default.jpg',
    );

Map<String, dynamic> _$HotelMinToJson(HotelMin instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      json['uuid'] as String,
      json['name'] as String,
      json['poster'] as String,
      Address.fromJson(json['address'] as Map<String, dynamic>),
      (json['price'] as num).toDouble(),
      (json['rating'] as num).toDouble(),
      HotelServices.fromJson(json['services'] as Map<String, dynamic>),
      (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['country'] as String,
      json['city'] as String,
      json['street'] as String,
      json['zip_code'] as int,
      Coords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
      'zip_code': instance.zipCode,
      'coords': instance.coords,
    };

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      (json['lat'] as num).toDouble(),
      (json['lan'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

HotelServices _$HotelServicesFromJson(Map<String, dynamic> json) =>
    HotelServices(
      (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelServicesToJson(HotelServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
