import 'dart:convert';

class ConversationModel {
  final String? id;
  final LastMessage? lastMessage;
  final UserData? userData;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? unseenMsg;

  ConversationModel({
    this.id,
    this.lastMessage,
    this.userData,
    this.createdAt,
    this.updatedAt,
    this.unseenMsg,
  });

  factory ConversationModel.fromJson(String str) =>
      ConversationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromMap(
    Map<String, dynamic> json,
  ) => ConversationModel(
    id: json["_id"],
    lastMessage:
        json["lastMessage"] == null
            ? null
            : LastMessage.fromMap(json["lastMessage"]),
    userData:
        json["userData"] == null ? null : UserData.fromMap(json["userData"]),
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    unseenMsg: json["unseenMsg"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "lastMessage": lastMessage?.toMap(),
    "userData": userData?.toMap(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "unseenMsg": unseenMsg,
  };
}

class LastMessage {
  final String? id;
  final String? text;
  final List<dynamic>? imageUrl;
  final List<dynamic>? videoUrl;
  final bool? seen;
  final String? msgByUserId;
  final String? conversationId;
  final String? createdAt;
  final DateTime? updatedAt;
  final int? v;

  LastMessage({
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

  factory LastMessage.fromJson(String str) =>
      LastMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LastMessage.fromMap(Map<String, dynamic> json) => LastMessage(
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
    msgByUserId: json["msgByUserId"],
    conversationId: json["conversationId"],
    createdAt: json["createdAt"],
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
    "msgByUserId": msgByUserId,
    "conversationId": conversationId,
    "createdAt": createdAt,
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class UserData {
  final String? id;
  final String? email;
  final String? name;
  final String? profileImage;

  UserData({this.id, this.email, this.name, this.profileImage});

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "email": email,
    "name": name,
    "profile_image": profileImage,
  };
}
