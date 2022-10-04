import 'loginModel.dart';

class ProfileModel {
  Status? status;
  LoginData? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ?  Status.fromJson(json['status']) : null;
    data = json['data'] != null ?  LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  String? type;

  Status({this.type});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}