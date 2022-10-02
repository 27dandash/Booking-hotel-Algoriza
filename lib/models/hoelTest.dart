class HoelTest {
  HoelTest({
    required this.data,
  });

  late final List<DataModel> data;

  HoelTest.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>DataModel.fromJson(e)).toList();
  }

}

class DataModel {

  DataModel({
  required this.id,
  required this.name,
  required this.description,
  // required this.price,
  // required this.address,
  // required this.longitude,
  // required this.latitude,
  // required this.rate,
  // required this.createdAt,
  // required this.updatedAt,
  // required this.hotelImages,
  // required this.hotelFacilities,
  });
  late final int id;
  late final String name;
  late final String description;
  // late final String price;
  // late final String address;
  // late final String longitude;
  // late final String latitude;
  // late final String rate;
  // late final String createdAt;
  // late final String updatedAt;
  // late final List<HotelImages> hotelImages;
  // late final List<HotelFacilities> hotelFacilities;

  DataModel.fromJson(Map<String, dynamic> json){
  id = json['id'];
  name = json['name'];
  description = json['description'];
  // price = json['price'];
  // address = json['address'];
  // longitude = json['longitude'];
  // latitude = json['latitude'];
  // rate = json['rate'];
  // createdAt = json['created_at'];
  // updatedAt = json['updated_at'];
  // hotelImages = List.from(json['hotel_images']).map((e)=>HotelImages.fromJson(e)).toList();
  // hotelFacilities = List.from(json['hotel_facilities']).map((e)=>HotelFacilities.fromJson(e)).toList();
  }

  }

