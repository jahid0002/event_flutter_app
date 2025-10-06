import 'dart:convert';

class HelpSuportModel {
  final String? id;
  final String? question;
  final String? answer;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? helpSuportModelId;

  HelpSuportModel({
    this.id,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.helpSuportModelId,
  });

  factory HelpSuportModel.fromJson(String str) =>
      HelpSuportModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HelpSuportModel.fromMap(Map<String, dynamic> json) => HelpSuportModel(
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    helpSuportModelId: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "question": question,
    "answer": answer,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": helpSuportModelId,
  };
}
