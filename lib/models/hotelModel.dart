class HotelModel {
  HotelModel({
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
  });
  late final List<Data> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;

  HotelModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    return _data;
  }
}

class Data {
  Data({
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
    required this.hotelImages,
    required this.hotelFacilities,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String price;
  late final String address;
  late final String longitude;
  late final String latitude;
  late final String rate;
  late final String createdAt;
  late final String updatedAt;
  late final List<HotelImages> hotelImages;
  late final List<HotelFacilities> hotelFacilities;

  Data.fromJson(Map<String, dynamic> json){
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
    hotelImages = List.from(json['hotel_images']).map((e)=>HotelImages.fromJson(e)).toList();
    hotelFacilities = List.from(json['hotel_facilities']).map((e)=>HotelFacilities.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['address'] = address;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    _data['rate'] = rate;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['hotel_images'] = hotelImages.map((e)=>e.toJson()).toList();
    _data['hotel_facilities'] = hotelFacilities.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class HotelImages {
  HotelImages({
    required this.id,
    required this.hotelId,
    required this.image,
  });
  late final int id;
  late final String hotelId;
  late final String image;

  HotelImages.fromJson(Map<String, dynamic> json){
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['hotel_id'] = hotelId;
    _data['image'] = image;
    return _data;
  }
}

class HotelFacilities {
  HotelFacilities({
    required this.id,
    required this.hotelId,
    required this.facilityId,
  });
  late final int id;
  late final String hotelId;
  late final String facilityId;

  HotelFacilities.fromJson(Map<String, dynamic> json){
    id = json['id'];
    hotelId = json['hotel_id'];
    facilityId = json['facility_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['hotel_id'] = hotelId;
    _data['facility_id'] = facilityId;
    return _data;
  }
}