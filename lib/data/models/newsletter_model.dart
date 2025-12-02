class NewsletterModel {
  final String id;
  final String email;
  final DateTime dateTime;
  final bool isDeleted;
  final bool isBlocked;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsletterModel({
    required this.id,
    required this.email,
    required this.dateTime,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsletterModel.fromJson(Map<String, dynamic> json) {
    return NewsletterModel(
      id: json["_id"],
      email: json["email"],
      dateTime: DateTime.parse(json["dateTime"]),
      isDeleted: json["isDeleted"],
      isBlocked: json["isBlocked"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "email": email,
      "dateTime": dateTime.toIso8601String(),
      "isDeleted": isDeleted,
      "isBlocked": isBlocked,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
