class LoginModel {
  Status? status;
  LoginData? data;

  LoginModel({this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  String? type;
  Title? title;

  Status({this.type, this.title});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    return data;
  }
}

class Title {
  String? ar;
  String? en;

  Title({this.ar, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

class LoginData {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? token;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? googleId;
  String? provider;

  LoginData(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.token,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.googleId,
        this.provider});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??'';
    email = json['email'];
    emailVerifiedAt = json['email_verified_at']??'';
    token = json['api_token']??'';
    image = json['image']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
    googleId = json['google_id']??'';
    provider = json['provider']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['api_token'] = this.token;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['google_id'] = this.googleId;
    data['provider'] = this.provider;
    return data;
  }
}

// class LoginModel {
//   final StatusModel status;
//   final UserModel? data;
//
//   LoginModel({
//     required this.status,
//     required this.data,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     return LoginModel(
//       status: StatusModel.fromJson(json['status']),
//       data: UserModel.fromJson(json['data']),
//     );
//   }
// }
// class UserModel {
//   final int? id;
//   final String? token;
//   final String? name;
//   final String? email;
//   final String? image;
//
//   UserModel({
//     this.id,
//     this.token,
//     this.name,
//     this.email,
//     this.image,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json["id"],
//       token: json['api_token'],
//       name: json['name'],
//       email: json['email'],
//       image: json['image'],
//     );
//   }
// }
// class StatusModel {
//   final String type;
//   final String messageAr;
//   final String messageEn;
//
//   StatusModel({
//     required this.type,
//     required this.messageAr,
//     required this.messageEn,
//   });
//
//   factory StatusModel.fromJson(Map<String, dynamic> json) {
//     return StatusModel(
//       type: json['type'] ?? '0',
//       messageAr:
//       json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
//       messageEn:
//       json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
//     );
//   }
// }
