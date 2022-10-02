import 'HotelFacilities.dart';
import 'HotelImages.dart';

class HotelModel {
  HotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    // required this.hotelImages,
    required this.hotelFacilities,
  });

  HotelModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // if (json['hotel_images'] != null) {
    //   hotelImages = [];
    //   json['hotel_images'].forEach((v) {
    //     hotelImages!.add(HotelImages.fromJson(v));
    //   });
    // }
    if (json['hotel_facilities'] != null) {
      hotelFacilities = [];
      json['hotel_facilities'].forEach((v) {
        hotelFacilities!.add(HotelFacilities.fromJson(v));
      });
    }
  }
  late int id;
  late String name;
  late String description;
  late String price;
  late String address;
  late String longitude;
  late String latitude;
  late String rate;
  late String createdAt;
  late String updatedAt;
  // List<HotelImages>? hotelImages;
  List<HotelFacilities>? hotelFacilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['address'] = address;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['rate'] = rate;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    // if (hotelImages != null) {
    //   map['hotel_images'] = hotelImages!.map((v) => v.toJson()).toList();
    // }
    map['hotel_facilities'] = hotelFacilities!.map((v) => v.toJson()).toList();
    return map;
  }
}