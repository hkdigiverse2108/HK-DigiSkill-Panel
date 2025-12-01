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
  List<dynamic> courseLessonsAssigned;
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

  factory CourseCurriculumsModel.fromJson(Map<String, dynamic> json) =>
      CourseCurriculumsModel(
        id: json["_id"],
        courseId: CourseId.fromJson(json["courseId"]),
        date: DateTime.parse(json["date"]),
        thumbnail: json["thumbnail"],
        videoLink: json["videoLink"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        attachment: json["attachment"],
        courseLessonsAssigned: List<dynamic>.from(
          json["courseLessonsAssigned"].map((x) => x),
        ),
        courseLessonsPriority: json["courseLessonsPriority"],
        curriculumLock: json["curriculumLock"],
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

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
    "courseLessonsAssigned": List<dynamic>.from(
      courseLessonsAssigned.map((x) => x),
    ),
    "courseLessonsPriority": courseLessonsPriority,
    "curriculumLock": curriculumLock,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
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
