class CourseCurriculumsModel {
  String id;
  CourseId courseId;
  DateTime date;
  String thumbnail;
  String videoLink;
  String title;
  String description;
  String duration;
  String attachment;
  List<CourseLessonMiniModel> courseLessonsAssigned;
  int courseLessonsPriority;
  bool curriculumLock;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;

  CourseCurriculumsModel({
    required this.id,
    required this.courseId,
    required this.date,
    required this.thumbnail,
    required this.videoLink,
    required this.title,
    required this.description,
    required this.duration,
    required this.attachment,
    required this.courseLessonsAssigned,
    required this.courseLessonsPriority,
    required this.curriculumLock,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseCurriculumsModel.fromJson(Map<String, dynamic> json) {
    return CourseCurriculumsModel(
      id: json["_id"],
      courseId: CourseId.fromJson(json["courseId"]),
      date: DateTime.parse(json["date"]),
      thumbnail: json["thumbnail"] ?? "",
      videoLink: json["videoLink"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      duration: json["duration"] ?? "",
      attachment: json["attachment"] ?? "",
      courseLessonsAssigned: json["courseLessonsAssigned"] == null
          ? []
          : (json["courseLessonsAssigned"] as List)
                .map((e) => CourseLessonMiniModel.fromJson(e))
                .toList(),
      courseLessonsPriority: json["courseLessonsPriority"] ?? 0,
      curriculumLock: json["curriculumLock"] ?? false,
      isDeleted: json["isDeleted"] ?? false,
      isBlocked: json["isBlocked"] ?? false,
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "courseId": courseId.toJson(),
    "date": date.toIso8601String(),
    "thumbnail": thumbnail,
    "videoLink": videoLink,
    "title": title,
    "description": description,
    "duration": duration,
    "attachment": attachment,
    "courseLessonsAssigned": courseLessonsAssigned
        .map((e) => e.toJson())
        .toList(),
    "courseLessonsPriority": courseLessonsPriority,
    "curriculumLock": curriculumLock,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class CourseLessonMiniModel {
  String id;
  String title;
  String? subtitle;

  CourseLessonMiniModel({required this.id, required this.title, this.subtitle});

  factory CourseLessonMiniModel.fromJson(Map<String, dynamic> json) =>
      CourseLessonMiniModel(
        id: json["_id"],
        title: json["title"] ?? "",
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "subtitle": subtitle,
  };
}

class CourseId {
  String id;
  String name;
  String description;

  CourseId({required this.id, required this.name, required this.description});

  factory CourseId.fromJson(Map<String, dynamic> json) => CourseId(
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
