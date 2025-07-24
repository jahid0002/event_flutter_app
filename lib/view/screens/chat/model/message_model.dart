import 'dart:convert';

class MessageModel {
  final String? id;
  final String? text;
  final List<dynamic>? imageUrl;
  final List<dynamic>? videoUrl;
  final bool? seen;
  final MsgByUserId? msgByUserId;
  final String? conversationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  MessageModel({
    this.id,
    this.text,
    this.imageUrl,
    this.videoUrl,
    this.seen,
    this.msgByUserId,
    this.conversationId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MessageModel.fromJson(String str) =>
      MessageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
    id: json["_id"],
    text: json["text"],
    imageUrl:
        json["imageUrl"] == null
            ? []
            : List<dynamic>.from(json["imageUrl"]!.map((x) => x)),
    videoUrl:
        json["videoUrl"] == null
            ? []
            : List<dynamic>.from(json["videoUrl"]!.map((x) => x)),
    seen: json["seen"],
    msgByUserId:
        json["msgByUserId"] == null
            ? null
            : MsgByUserId.fromMap(json["msgByUserId"]),
    conversationId: json["conversationId"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "text": text,
    "imageUrl":
        imageUrl == null ? [] : List<dynamic>.from(imageUrl!.map((x) => x)),
    "videoUrl":
        videoUrl == null ? [] : List<dynamic>.from(videoUrl!.map((x) => x)),
    "seen": seen,
    "msgByUserId": msgByUserId?.toMap(),
    "conversationId": conversationId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class MsgByUserId {
  final String? id;
  final String? name;
  final String? profileImage;

  MsgByUserId({this.id, this.name, this.profileImage});

  factory MsgByUserId.fromJson(String str) =>
      MsgByUserId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MsgByUserId.fromMap(Map<String, dynamic> json) => MsgByUserId(
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
