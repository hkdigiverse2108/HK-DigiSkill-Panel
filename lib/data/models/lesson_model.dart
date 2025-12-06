class CourseLessonModel {
  final String id;
  final LessonCourseModel? courseId;
  final String title;
  final String? subtitle;
  final int priority;
  final bool lessonLock;
  final bool isDeleted;
  final bool isBlocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CourseLessonModel({
    required this.id,
    this.courseId,
    required this.title,
    this.subtitle,
    this.priority = 0,
    this.lessonLock = false,
    this.isDeleted = false,
    this.isBlocked = false,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseLessonModel.fromJson(Map<String, dynamic> json) {
    return CourseLessonModel(
      id: json['_id'] ?? '',
      courseId: json['courseId'] != null
          ? LessonCourseModel.fromJson(json['courseId'])
          : null,
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      priority: json['priority'] ?? 0,
      lessonLock: json['lessonLock'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      isBlocked: json['isBlocked'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "courseId": courseId?.toJson(),
      "title": title,
      "subtitle": subtitle,
      "priority": priority,
      "lessonLock": lessonLock,
      "isDeleted": isDeleted,
      "isBlocked": isBlocked,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
    };
  }

  CourseLessonModel copyWith({
    String? id,
    LessonCourseModel? courseId,
    String? title,
    String? subtitle,
    int? priority,
    bool? lessonLock,
    bool? isDeleted,
    bool? isBlocked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CourseLessonModel(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      priority: priority ?? this.priority,
      lessonLock: lessonLock ?? this.lessonLock,
      isDeleted: isDeleted ?? this.isDeleted,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class LessonCourseModel {
  final String id;
  final String name;
  final String? description;

  LessonCourseModel({required this.id, required this.name, this.description});

  factory LessonCourseModel.fromJson(Map<String, dynamic> json) {
    return LessonCourseModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "name": name, "description": description};
  }
}
