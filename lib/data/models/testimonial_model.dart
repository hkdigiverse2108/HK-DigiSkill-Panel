class TestimonialModel {
  String id;
  String name;
  String designation;
  int rate;
  bool isFeatured;
  String type;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;
  String? image;
  String? description;

  final LearningCatalogRef? learningCatalog; // dynamic reference

  TestimonialModel({
    required this.id,
    required this.name,
    required this.designation,
    required this.rate,
    required this.isFeatured,
    required this.type,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    this.description,
    this.learningCatalog,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) =>
      TestimonialModel(
        id: json["_id"],
        name: json["name"],
        designation: json["designation"],
        rate: json["rate"],
        isFeatured: json["isFeatured"],
        type: json["type"],
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        image: json["image"],
        description: json["description"],
        learningCatalog: json["learningCatalogId"] != null
            ? LearningCatalogRef.fromJson(json["learningCatalogId"])
            : null,
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "designation": designation,
    "rate": rate,
    "isFeatured": isFeatured,
    "type": type,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "image": image,
    "description": description,
    "learningCatalogId": learningCatalog?.toJson(),
  };
}

class LearningCatalogRef {
  final String id;
  final String? title;
  final String? name; // because some modules use 'name', some use 'title'

  LearningCatalogRef({required this.id, this.title, this.name});

  factory LearningCatalogRef.fromJson(Map<String, dynamic> json) {
    return LearningCatalogRef(
      id: json["_id"],
      title: json["title"], // for workshop
      name: json["name"], // for course/instructor/etc.
    );
  }

  Map<String, dynamic> toJson() => {"_id": id, "title": title, "name": name};
}
