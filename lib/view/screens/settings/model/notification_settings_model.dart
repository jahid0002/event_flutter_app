import 'dart:convert';

class NotificationSettingsModel {
  final String? id;
  final String? user;
  final bool? generalNotification;
  final bool? matchNotification;
  final bool? messageNotification;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  NotificationSettingsModel({
    this.id,
    this.user,
    this.generalNotification,
    this.matchNotification,
    this.messageNotification,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationSettingsModel.fromJson(String str) =>
      NotificationSettingsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationSettingsModel.fromMap(
    Map<String, dynamic> json,
  ) => NotificationSettingsModel(
    id: json["_id"],
    user: json["user"],
    generalNotification: json["generalNotification"],
    matchNotification: json["matchNotification"],
    messageNotification: json["messageNotification"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "user": user,
    "generalNotification": generalNotification,
    "matchNotification": matchNotification,
    "messageNotification": messageNotification,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
