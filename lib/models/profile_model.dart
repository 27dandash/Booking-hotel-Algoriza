import 'loginModel.dart';

class ProfileModel {
  Status? status;
  LoginData? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ?  Status.fromJson(json['status']) : null;
    data = json['data'] != null ?  LoginData.fromJson(json['data']) : null;
  }

}

class Status {
  String? type;

  Status({this.type});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }
}



class TestProfile {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? token;
  String? image;
  String? googleId;

  TestProfile(
      {this.id,
      this.name,
      this.email,
      this.token,
      this.image,
      this.googleId,
      });

  TestProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    token = json['api_token'] ?? '';
    image = json['image'] ?? '';
    googleId = json['google_id'] ?? '';
  }

}