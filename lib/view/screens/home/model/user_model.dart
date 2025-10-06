import 'dart:convert';

class UserModel {
  final String? id;
  final User? user;
  final String? name;
  final String? email;
  final String? profileImage;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final DateTime? dateOfBirth;
  final Hotel? hotel;
  Connection? connection;
  final String? address;
  final num? age;
  final List<String>? interests; // ✅ Added

  UserModel({
    this.id,
    this.user,
    this.name,
    this.email,
    this.profileImage,
    this.checkInDate,
    this.checkOutDate,
    this.dateOfBirth,
    this.hotel,
    this.connection,
    this.address,
    this.age,
    this.interests, // ✅ Added
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
    name: json["name"],
    email: json["email"],
    profileImage: json["profile_image"],
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
    hotel: json["hotel"] == null ? null : Hotel.fromMap(json["hotel"]),
    connection:
        json["connection"] == null
            ? null
            : Connection.fromMap(json["connection"]),
    address: json["address"],
    age: json["age"],
    interests:
        json["interests"] == null
            ? []
            : List<String>.from(json["interests"].map((x) => x)), // ✅ Added
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "user": user?.toMap(),
    "name": name,
    "email": email,
    "profile_image": profileImage,
    "checkInDate": checkInDate?.toIso8601String(),
    "checkOutDate": checkOutDate?.toIso8601String(),
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "hotel": hotel?.toMap(),
    "connection": connection?.toMap(),
    "address": address,
    "age": age,
    "interests":
        interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)), // ✅ Added
  };
}

class Connection {
  final String? id;
  final String? sender;
  final String? receiver;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Connection({
    this.id,
    this.sender,
    this.receiver,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Connection.fromJson(String str) =>
      Connection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Connection.fromMap(Map<String, dynamic> json) => Connection(
    id: json["_id"],
    sender: json["sender"],
    receiver: json["receiver"],
    status: json["status"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "sender": sender,
    "receiver": receiver,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Hotel {
  final String? id;
  final String? name;
  final String? location;
  final String? hotelImage;

  Hotel({this.id, this.name, this.location, this.hotelImage});

  factory Hotel.fromJson(String str) => Hotel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
    id: json["_id"],
    name: json["name"],
    location: json["location"],
    hotelImage: json["hotel_image"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "location": location,
    "hotel_image": hotelImage,
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

// import 'dart:convert';

// class UserModel {
//   final String? id;
//   final User? user;
//   final String? name;
//   final String? email;
//   final String? profileImage;
//   final DateTime? checkInDate;
//   final DateTime? checkOutDate;
//   final DateTime? dateOfBirth;
//   final Hotel? hotel;
//   Connection? connection;
//   final String? address;
//   final num? age;

//   UserModel({
//     this.id,
//     this.user,
//     this.name,
//     this.email,
//     this.profileImage,
//     this.checkInDate,
//     this.checkOutDate,
//     this.dateOfBirth,
//     this.hotel,
//     this.connection,
//     this.address,
//     this.age,
//   });

//   factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
//     id: json["_id"],
//     user: json["user"] == null ? null : User.fromMap(json["user"]),
//     name: json["name"],
//     email: json["email"],
//     profileImage: json["profile_image"],
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
//     hotel: json["hotel"] == null ? null : Hotel.fromMap(json["hotel"]),
//     connection:
//         json["connection"] == null
//             ? null
//             : Connection.fromMap(json["connection"]),
//     address: json["address"],
//     age: json["age"],
//   );

//   Map<String, dynamic> toMap() => {
//     "_id": id,
//     "user": user?.toMap(),
//     "name": name,
//     "email": email,
//     "profile_image": profileImage,
//     "checkInDate": checkInDate?.toIso8601String(),
//     "checkOutDate": checkOutDate?.toIso8601String(),
//     "dateOfBirth": dateOfBirth?.toIso8601String(),
//     "hotel": hotel?.toMap(),
//     "connection": connection?.toMap(),
//     "address": address,
//     "age": age,
//   };
// }

// class Connection {
//   final String? id;
//   final String? sender;
//   final String? receiver;
//   final String? status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? v;

//   Connection({
//     this.id,
//     this.sender,
//     this.receiver,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });

//   factory Connection.fromJson(String str) =>
//       Connection.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Connection.fromMap(Map<String, dynamic> json) => Connection(
//     id: json["_id"],
//     sender: json["sender"],
//     receiver: json["receiver"],
//     status: json["status"],
//     createdAt:
//         json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt:
//         json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );

//   Map<String, dynamic> toMap() => {
//     "_id": id,
//     "sender": sender,
//     "receiver": receiver,
//     "status": status,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//   };
// }

// class Hotel {
//   final String? id;
//   final String? name;
//   final String? location;
//   final String? hotelImage;

//   Hotel({this.id, this.name, this.location, this.hotelImage});

//   factory Hotel.fromJson(String str) => Hotel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
//     id: json["_id"],
//     name: json["name"],
//     location: json["location"],
//     hotelImage: json["hotel_image"],
//   );

//   Map<String, dynamic> toMap() => {
//     "_id": id,
//     "name": name,
//     "location": location,
//     "hotel_image": hotelImage,
//   };
// }

// class User {
//   final String? id;
//   final bool? isBlocked;

//   User({this.id, this.isBlocked});

//   factory User.fromJson(String str) => User.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory User.fromMap(Map<String, dynamic> json) =>
//       User(id: json["_id"], isBlocked: json["isBlocked"]);

//   Map<String, dynamic> toMap() => {"_id": id, "isBlocked": isBlocked};
// }
