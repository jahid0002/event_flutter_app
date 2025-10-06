import 'dart:convert';

class ProfileModel {
  final String? id;
  final String? user;
  final String? name;
  final String? email;
  final String? profileImage;
  final List<String>? interests;
  List<String>? pictures;
  final List<String>? language;
  final List<dynamic>? blockedUsers;
  final bool? isRegistrationCompleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? address;
  final int? age;
  final String? bio;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final String? gender;
  final Hotel? hotel;
  final String? phone;

  ProfileModel({
    this.id,
    this.user,
    this.name,
    this.email,
    this.profileImage,
    this.interests,
    this.pictures,
    this.language,
    this.blockedUsers,
    this.isRegistrationCompleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.age,
    this.bio,
    this.checkInDate,
    this.checkOutDate,
    this.gender,
    this.hotel,
    this.phone,
  });

  factory ProfileModel.fromJson(String str) =>
      ProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
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
    blockedUsers:
        json["blockedUsers"] == null
            ? []
            : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
    isRegistrationCompleted: json["isRegistrationCompleted"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    address: json["address"],
    age: json["age"],
    bio: json["bio"],
    checkInDate:
        json["checkInDate"] == null
            ? null
            : DateTime.parse(json["checkInDate"]),
    checkOutDate:
        json["checkOutDate"] == null
            ? null
            : DateTime.parse(json["checkOutDate"]),
    gender: json["gender"],
    hotel: json["hotel"] == null ? null : Hotel.fromMap(json["hotel"]),
    phone: json["phone"],
  );

  Map<String, dynamic> toMap() => {
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
    "blockedUsers":
        blockedUsers == null
            ? []
            : List<dynamic>.from(blockedUsers!.map((x) => x)),
    "isRegistrationCompleted": isRegistrationCompleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "address": address,
    "age": age,
    "bio": bio,
    "checkInDate": checkInDate?.toIso8601String(),
    "checkOutDate": checkOutDate?.toIso8601String(),
    "gender": gender,
    "hotel": hotel?.toMap(),
    "phone": phone,
  };
}

class Hotel {
  final String? id;
  final String? name;

  Hotel({this.id, this.name});

  factory Hotel.fromMap(Map<String, dynamic> json) =>
      Hotel(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toMap() => {"_id": id, "name": name};
}

// import 'dart:convert';

// class ProfileModel {
//   final String? id;
//   final String? user;
//   final String? name;
//   final String? email;
//   final String? profileImage;
//   final List<String>? interests;
//   List<String>? pictures;
//   final List<String>? language;
//   final List<dynamic>? blockedUsers;
//   final bool? isRegistrationCompleted;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? v;
//   final String? address;
//   final int? age;
//   final String? bio;
//   final DateTime? checkInDate;
//   final DateTime? checkOutDate;
//   final String? gender;
//   final String? hotel;
//   final String? phone;

//   ProfileModel({
//     this.id,
//     this.user,
//     this.name,
//     this.email,
//     this.profileImage,
//     this.interests,
//     this.pictures,
//     this.language,
//     this.blockedUsers,
//     this.isRegistrationCompleted,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.address,
//     this.age,
//     this.bio,
//     this.checkInDate,
//     this.checkOutDate,
//     this.gender,
//     this.hotel,
//     this.phone,
//   });

//   factory ProfileModel.fromJson(String str) =>
//       ProfileModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
//     id: json["_id"],
//     user: json["user"],
//     name: json["name"],
//     email: json["email"],
//     profileImage: json["profile_image"],
//     interests:
//         json["interests"] == null
//             ? []
//             : List<String>.from(json["interests"]!.map((x) => x)),
//     pictures:
//         json["pictures"] == null
//             ? []
//             : List<String>.from(json["pictures"]!.map((x) => x)),
//     language:
//         json["language"] == null
//             ? []
//             : List<String>.from(json["language"]!.map((x) => x)),
//     blockedUsers:
//         json["blockedUsers"] == null
//             ? []
//             : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
//     isRegistrationCompleted: json["isRegistrationCompleted"],
//     createdAt:
//         json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt:
//         json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     address: json["address"],
//     age: json["age"],
//     bio: json["bio"],
//     checkInDate:
//         json["checkInDate"] == null
//             ? null
//             : DateTime.parse(json["checkInDate"]),
//     checkOutDate:
//         json["checkOutDate"] == null
//             ? null
//             : DateTime.parse(json["checkOutDate"]),
//     gender: json["gender"],
//     hotel: json["hotel"],
//     phone: json["phone"],
//   );

//   Map<String, dynamic> toMap() => {
//     "_id": id,
//     "user": user,
//     "name": name,
//     "email": email,
//     "profile_image": profileImage,
//     "interests":
//         interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
//     "pictures":
//         pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
//     "language":
//         language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
//     "blockedUsers":
//         blockedUsers == null
//             ? []
//             : List<dynamic>.from(blockedUsers!.map((x) => x)),
//     "isRegistrationCompleted": isRegistrationCompleted,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "address": address,
//     "age": age,
//     "bio": bio,
//     "checkInDate": checkInDate?.toIso8601String(),
//     "checkOutDate": checkOutDate?.toIso8601String(),
//     "gender": gender,
//     "hotel": hotel,
//     "phone": phone,
//   };
// }
