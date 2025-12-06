class CourseModel {
  String id;
  String name;
  CourseCategoryId courseCategoryId;
  String description;
  double price;
  double mrpPrice;
  String language;
  String image;
  String? pdf;
  bool purchasedCoursesShow;
  int enrolledLearners;
  int classCompleted;
  int satisfactionRate;
  int? duration;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;

  CourseModel({
    required this.id,
    required this.name,
    required this.courseCategoryId,
    required this.description,
    required this.price,
    required this.mrpPrice,
    required this.language,
    required this.image,
    this.pdf,
    required this.purchasedCoursesShow,
    required this.enrolledLearners,
    required this.classCompleted,
    required this.satisfactionRate,
    required this.duration,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json["_id"],
    name: json["name"],
    courseCategoryId: CourseCategoryId.fromJson(json["courseCategoryId"]),
    description: json["description"],
    price: json["price"]?.toDouble(),
    mrpPrice: json["mrpPrice"]?.toDouble() ?? 0.0,
    language: json["language"] ?? 'English',
    image: json["image"],
    purchasedCoursesShow: json["purchasedCoursesShow"],
    enrolledLearners: json["enrolledLearners"],
    classCompleted: json["classCompleted"],
    satisfactionRate: json["satisfactionRate"],
    duration: json["duration"] ?? 0,
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    pdf: json["pdf"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    'name': name,
    'courseCategoryId': courseCategoryId.id,
    'description': description,
    'price': price,
    'mrpPrice': mrpPrice,
    'language': language,
    'image': image,
    'purchasedCoursesShow': purchasedCoursesShow,
    'enrolledLearners': enrolledLearners,
    'classCompleted': classCompleted,
    'satisfactionRate': satisfactionRate,
    'duration': duration,
    'isDeleted': isDeleted,
    'isBlocked': isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class CourseCategoryId {
  String id;
  String name;
  String description;

  CourseCategoryId({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CourseCategoryId.fromJson(Map<String, dynamic> json) =>
      CourseCategoryId(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
  };
}
