import 'dart:convert';

class TermsConditionModel {
  final String? id;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? termsConditionModelId;

  TermsConditionModel({
    this.id,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.termsConditionModelId,
  });

  factory TermsConditionModel.fromJson(String str) =>
      TermsConditionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TermsConditionModel.fromMap(
    Map<String, dynamic> json,
  ) => TermsConditionModel(
    id: json["_id"],
    description: json["description"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    termsConditionModelId: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": termsConditionModelId,
  };
}
