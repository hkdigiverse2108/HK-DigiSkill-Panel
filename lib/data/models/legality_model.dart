class LegalityModel {
  final String id;
  final String type;
  final String content;
  final bool isDeleted;
  final bool isBlocked;
  final DateTime createdAt;
  final DateTime updatedAt;

  LegalityModel({
    required this.id,
    required this.type,
    required this.content,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LegalityModel.fromJson(Map<String, dynamic> json) {
    return LegalityModel(
      id: json["_id"],
      type: json["type"],
      content: json["content"],
      isDeleted: json["isDeleted"],
      isBlocked: json["isBlocked"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "content": content,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
