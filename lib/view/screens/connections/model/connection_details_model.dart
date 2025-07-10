import 'dart:convert';

class ConnectionDetailsModel {
  final List<dynamic>? blockedUsers;
  final String? id;
  final String? user;
  final String? name;
  final String? email;
  final String? profileImage;
  final List<String>? interests;
  final List<String>? pictures;
  final List<String>? language;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? address;
  final String? bio;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? phone;
  final bool? isRegistrationCompleted;
  final String? hotel;

  ConnectionDetailsModel({
    this.blockedUsers,
    this.id,
    this.user,
    this.name,
    this.email,
    this.profileImage,
    this.interests,
    this.pictures,
    this.language,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.bio,
    this.checkInDate,
    this.checkOutDate,
    this.dateOfBirth,
    this.gender,
    this.phone,
    this.isRegistrationCompleted,
    this.hotel,
  });

  factory ConnectionDetailsModel.fromJson(String str) =>
      ConnectionDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConnectionDetailsModel.fromMap(
    Map<String, dynamic> json,
  ) => ConnectionDetailsModel(
    blockedUsers:
        json["blockedUsers"] == null
            ? []
            : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
    id: json["_id"],
    user: json["user"],
    name: json["name"],
    email: json["email"],
    profileImage: json["profile_image"],
    interests:
        json["interests"] == null
            ? []
            : List<String>.from(json["interests"]!.map((x) => x)),
    pictures:
        json["pictures"] == null
            ? []
            : List<String>.from(json["pictures"]!.map((x) => x)),
    language:
        json["language"] == null
            ? []
            : List<String>.from(json["language"]!.map((x) => x)),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    address: json["address"],
    bio: json["bio"],
    checkInDate:
        json["checkInDate"] == null
            ? null
            : DateTime.parse(json["checkInDate"]),
    checkOutDate:
        json["checkOutDate"] == null
            ? null
            : DateTime.parse(json["checkOutDate"]),
    dateOfBirth:
        json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
    gender: json["gender"],
    phone: json["phone"],
    isRegistrationCompleted: json["isRegistrationCompleted"],
    hotel: json["hotel"],
  );

  Map<String, dynamic> toMap() => {
    "blockedUsers":
        blockedUsers == null
            ? []
            : List<dynamic>.from(blockedUsers!.map((x) => x)),
    "_id": id,
    "user": user,
    "name": name,
    "email": email,
    "profile_image": profileImage,
    "interests":
        interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
    "pictures":
        pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
    "language":
        language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "address": address,
    "bio": bio,
    "checkInDate": checkInDate?.toIso8601String(),
    "checkOutDate": checkOutDate?.toIso8601String(),
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "gender": gender,
    "phone": phone,
    "isRegistrationCompleted": isRegistrationCompleted,
    "hotel": hotel,
  };
}
