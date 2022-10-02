class HotelImages {
  HotelImages({
    required this.id,
    required this.hotelId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  HotelImages.fromJson(dynamic json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  late int id;
  late String hotelId;
  String? image;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['hotel_id'] = hotelId;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
