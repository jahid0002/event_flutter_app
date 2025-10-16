import 'dart:convert';

class ConnectionDetailsModel {
  final String? id;
  final User? user;
  final String? name;
  final String? email;
  final String? profileImage;
  final List<String>? interests;
  final List<String>? pictures;
  final List<String>? language;
  final List<dynamic>? blockedUsers;
  final bool? isRegistrationCompleted;
  final Hotel? hotel;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? address;
  final int? age;
  final String? bio;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final String? gender;
  final String? phone;
  final Connection? connection;

  ConnectionDetailsModel({
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
    this.hotel,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.age,
    this.bio,
    this.checkInDate,
    this.checkOutDate,
    this.gender,
    this.phone,
    this.connection,
  });

  factory ConnectionDetailsModel.fromJson(String str) =>
      ConnectionDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConnectionDetailsModel.fromMap(
    Map<String, dynamic> json,
  ) => ConnectionDetailsModel(
    id: json["_id"],
    user:
        json["user"] == null
            ? null
            : (json["user"] is Map
                ? User.fromMap(json["user"])
                : User(id: json["user"])),
    name: json["name"],
    email: json["email"],
    profileImage: json["profile_image"],
    interests:
        json["interests"] == null
            ? []
            : List<String>.from(json["interests"].map((x) => x)),
    pictures:
        json["pictures"] == null
            ? []
            : List<String>.from(json["pictures"].map((x) => x)),
    language:
        json["language"] == null
            ? []
            : List<String>.from(json["language"].map((x) => x)),
    blockedUsers:
        json["blockedUsers"] == null
            ? []
            : List<dynamic>.from(json["blockedUsers"].map((x) => x)),
    isRegistrationCompleted: json["isRegistrationCompleted"],
    hotel: json["hotel"] == null ? null : Hotel.fromMap(json["hotel"]),
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
    phone: json["phone"],
    connection:
        json["connection"] == null
            ? null
            : Connection.fromMap(json["connection"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "user": user?.toMap(),
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
    "hotel": hotel?.toMap(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "address": address,
    "age": age,
    "bio": bio,
    "checkInDate": checkInDate?.toIso8601String(),
    "checkOutDate": checkOutDate?.toIso8601String(),
    "gender": gender,
    "phone": phone,
    "connection": connection?.toMap(),
  };
}

class Hotel {
  final String? id;
  final String? name;
  final String? location;
  final String? wifiIp;
  final String? hotelImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Hotel({
    this.id,
    this.name,
    this.location,
    this.wifiIp,
    this.hotelImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Hotel.fromJson(String str) => Hotel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
    id: json["_id"],
    name: json["name"],
    location: json["location"],
    wifiIp: json["wifiIp"],
    hotelImage: json["hotel_image"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "location": location,
    "wifiIp": wifiIp,
    "hotel_image": hotelImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class User {
  final String? id;

  User({this.id});

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(id: json["_id"]);

  Map<String, dynamic> toMap() => {"_id": id};
}

class Connection {
  final String? id;
  final String? sender;
  final String? receiver;
  final String? status;

  Connection({this.id, this.sender, this.receiver, this.status});

  factory Connection.fromJson(String str) =>
      Connection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Connection.fromMap(Map<String, dynamic> json) => Connection(
    id: json["_id"],
    sender: json["sender"],
    receiver: json["receiver"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "sender": sender,
    "receiver": receiver,
    "status": status,
  };
}

// import 'dart:convert';

// class ConnectionDetailsModel {
//   final String? id;
//   final User? user;
//   final String? name;
//   final String? email;
//   final String? profileImage;
//   final List<String>? interests;
//   final List<String>? pictures;
//   final List<String>? language;
//   final List<dynamic>? blockedUsers;
//   final bool? isRegistrationCompleted;
//   final Hotel? hotel;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? v;
//   final String? address;
//   final int? age;
//   final String? bio;
//   final DateTime? checkInDate;
//   final DateTime? checkOutDate;
//   final String? gender;
//   final String? phone;

//   ConnectionDetailsModel({
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
//     this.hotel,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.address,
//     this.age,
//     this.bio,
//     this.checkInDate,
//     this.checkOutDate,
//     this.gender,
//     this.phone,
//   });

//   factory ConnectionDetailsModel.fromJson(String str) =>
//       ConnectionDetailsModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory ConnectionDetailsModel.fromMap(
//     Map<String, dynamic> json,
//   ) => ConnectionDetailsModel(
//     id: json["_id"],
//     user: json["user"] == null ? null : User.fromMap(json["user"]),
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
//     hotel: json["hotel"] == null ? null : Hotel.fromMap(json["hotel"]),
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
//     phone: json["phone"],
//   );

//   Map<String, dynamic> toMap() => {
//     "_id": id,
//     "user": user?.toMap(),
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
//     "hotel": hotel?.toMap(),
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "address": address,
//     "age": age,
//     "bio": bio,
//     "checkInDate": checkInDate?.toIso8601String(),
//     "checkOutDate": checkOutDate?.toIso8601String(),
//     "gender": gender,
//     "phone": phone,
//   };
// }

// class Hotel {
//   final String? id;
//   final String? name;

//   Hotel({this.id, this.name});

//   factory Hotel.fromJson(String str) => Hotel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Hotel.fromMap(Map<String, dynamic> json) =>
//       Hotel(id: json["_id"], name: json["name"]);

//   Map<String, dynamic> toMap() => {"_id": id, "name": name};
// }

// class User {
//   final String? id;

//   User({this.id});

//   factory User.fromJson(String str) => User.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory User.fromMap(Map<String, dynamic> json) => User(id: json["_id"]);

//   Map<String, dynamic> toMap() => {"_id": id};
// }

// import 'dart:convert';

// class ConnectionDetailsModel {
//   final List<dynamic>? blockedUsers;
//   final String? id;
//   final String? user;
//   final String? name;
//   final String? email;
//   final String? profileImage;
//   final List<String>? interests;
//   final List<String>? pictures;
//   final List<String>? language;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? v;
//   final String? address;
//   final String? bio;
//   final DateTime? checkInDate;
//   final DateTime? checkOutDate;
//   final DateTime? dateOfBirth;
//   final String? gender;
//   final String? phone;
//   final bool? isRegistrationCompleted;
//   final String? hotel;

//   ConnectionDetailsModel({
//     this.blockedUsers,
//     this.id,
//     this.user,
//     this.name,
//     this.email,
//     this.profileImage,
//     this.interests,
//     this.pictures,
//     this.language,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.address,
//     this.bio,
//     this.checkInDate,
//     this.checkOutDate,
//     this.dateOfBirth,
//     this.gender,
//     this.phone,
//     this.isRegistrationCompleted,
//     this.hotel,
//   });

//   factory ConnectionDetailsModel.fromJson(String str) =>
//       ConnectionDetailsModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory ConnectionDetailsModel.fromMap(
//     Map<String, dynamic> json,
//   ) => ConnectionDetailsModel(
//     blockedUsers:
//         json["blockedUsers"] == null
//             ? []
//             : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
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
//     createdAt:
//         json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt:
//         json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     address: json["address"],
//     bio: json["bio"],
//     checkInDate:
//         json["checkInDate"] == null
//             ? null
//             : DateTime.parse(json["checkInDate"]),
//     checkOutDate:
//         json["checkOutDate"] == null
//             ? null
//             : DateTime.parse(json["checkOutDate"]),
//     dateOfBirth:
//         json["dateOfBirth"] == null
//             ? null
//             : DateTime.parse(json["dateOfBirth"]),
//     gender: json["gender"],
//     phone: json["phone"],
//     isRegistrationCompleted: json["isRegistrationCompleted"],
//     hotel: json["hotel"],
//   );

//   Map<String, dynamic> toMap() => {
//     "blockedUsers":
//         blockedUsers == null
//             ? []
//             : List<dynamic>.from(blockedUsers!.map((x) => x)),
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
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "address": address,
//     "bio": bio,
//     "checkInDate": checkInDate?.toIso8601String(),
//     "checkOutDate": checkOutDate?.toIso8601String(),
//     "dateOfBirth": dateOfBirth?.toIso8601String(),
//     "gender": gender,
//     "phone": phone,
//     "isRegistrationCompleted": isRegistrationCompleted,
//     "hotel": hotel,
//   };
// }
