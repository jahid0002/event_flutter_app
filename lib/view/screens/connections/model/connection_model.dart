import 'dart:convert';

class ConnectionModel {
  final String? id;
  final String? status;
  final OtherUser? otherUser;

  ConnectionModel({this.id, this.status, this.otherUser});

  factory ConnectionModel.fromJson(String str) =>
      ConnectionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConnectionModel.fromMap(Map<String, dynamic> json) => ConnectionModel(
    id: json["_id"],
    status: json["status"],
    otherUser:
        json["otherUser"] == null ? null : OtherUser.fromMap(json["otherUser"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "status": status,
    "otherUser": otherUser?.toMap(),
  };
}

class OtherUser {
  final String? id;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? address;
  final int? age;

  OtherUser({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.address,
    this.age,
  });

  factory OtherUser.fromJson(String str) => OtherUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtherUser.fromMap(Map<String, dynamic> json) => OtherUser(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    profileImage: json["profile_image"],
    address: json["address"],
    age: json["age"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "email": email,
    "profile_image": profileImage,
    "address": address,
    "age": age,
  };
}
