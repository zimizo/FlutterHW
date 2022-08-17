class HotelMin {
  final String uuid;
  final String name;
  final String poster;
  HotelMin(this.uuid, this.name, {this.poster = 'default.jpg'});
}

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
}

class Address {
  final String country;
  final String city;
  final String street;
  final int zipCode;
  final Coords coords;
  Address(this.country, this.city, this.street, this.zipCode, this.coords);
}

class Coords {
  final double lat;
  final double lan;
  Coords(this.lat, this.lan);
}

class HotelServices {
  final List<String> free;
  final List<String> paid;
  HotelServices(this.free, this.paid);
}
