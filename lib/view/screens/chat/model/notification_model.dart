import 'dart:convert';

class NotificationModel {
  final String? id;
  final Sender? sender;
  final String? receiver;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  NotificationModel({
    this.id,
    this.sender,
    this.receiver,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationModel.fromJson(String str) =>
      NotificationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromMap(
    Map<String, dynamic> json,
  ) => NotificationModel(
    id: json["_id"],
    sender: json["sender"] == null ? null : Sender.fromMap(json["sender"]),
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
    "sender": sender?.toMap(),
    "receiver": receiver,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Sender {
  final String? id;
  final String? name;
  final String? profileImage;

  Sender({this.id, this.name, this.profileImage});

  factory Sender.fromJson(String str) => Sender.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sender.fromMap(Map<String, dynamic> json) => Sender(
    id: json["_id"],
    name: json["name"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "profile_image": profileImage,
  };
}
