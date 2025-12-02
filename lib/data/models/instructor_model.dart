class InstructorModel {
  String id;
  String? image;
  String name;
  String? designation;
  String? linkedin;
  String? instagram;
  String? facebook;
  String? twitter;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;

  InstructorModel({
    required this.id,
    this.image,
    required this.name,
    this.designation,
    this.linkedin,
    this.instagram,
    this.facebook,
    this.twitter,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      InstructorModel(
        id: json["_id"],
        image: json["image"],
        name: json["name"],
        designation: json["designation"],
        linkedin: json["linkedin"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        isDeleted: json["isDeleted"] ?? false,
        isBlocked: json["isBlocked"] ?? false,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "name": name,
    "designation": designation,
    "linkedin": linkedin,
    "instagram": instagram,
    "facebook": facebook,
    "twitter": twitter,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
