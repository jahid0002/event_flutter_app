import 'dart:convert';

class UserModel {
  final String? id;
  final User? user;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? address;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final int? age;

  UserModel({
    this.id,
    this.user,
    this.name,
    this.email,
    this.profileImage,
    this.address,
    this.checkInDate,
    this.checkOutDate,
    this.age,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
    name: json["name"],
    email: json["email"],
    profileImage: json["profile_image"],
    address: json["address"],
    checkInDate:
        json["checkInDate"] == null
            ? null
            : DateTime.parse(json["checkInDate"]),
    checkOutDate:
        json["checkOutDate"] == null
            ? null
            : DateTime.parse(json["checkOutDate"]),
    age: json["age"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "user": user?.toMap(),
    "name": name,
    "email": email,
    "profile_image": profileImage,
    "address": address,
    "checkInDate": checkInDate?.toIso8601String(),
    "checkOutDate": checkOutDate?.toIso8601String(),
    "age": age,
  };
}

class User {
  final String? id;
  final bool? isBlocked;

  User({this.id, this.isBlocked});

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) =>
      User(id: json["_id"], isBlocked: json["isBlocked"]);

  Map<String, dynamic> toMap() => {"_id": id, "isBlocked": isBlocked};
}
