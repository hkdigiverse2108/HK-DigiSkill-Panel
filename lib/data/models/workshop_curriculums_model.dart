class WorkshopCurriculumsModel {
  String id;
  WorkshopId workshopId;
  DateTime date;
  String thumbnail;
  String videoLink;
  String title;
  String description;
  String duration;
  String attachment;
  int? priority;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;

  WorkshopCurriculumsModel({
    required this.id,
    required this.workshopId,
    required this.date,
    required this.thumbnail,
    required this.videoLink,
    required this.title,
    required this.description,
    required this.duration,
    required this.attachment,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    this.priority,
  });

  factory WorkshopCurriculumsModel.fromJson(Map<String, dynamic> json) =>
      WorkshopCurriculumsModel(
        id: json["_id"],
        workshopId: WorkshopId.fromJson(json["workshopId"]),
        date: DateTime.parse(json["date"]),
        thumbnail: json["thumbnail"],
        videoLink: json["videoLink"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        attachment: json["attachment"],
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "workshopId": workshopId.toJson(),
    "date": date.toIso8601String(),
    "thumbnail": thumbnail,
    "videoLink": videoLink,
    "title": title,
    "description": description,
    "duration": duration,
    "attachment": attachment,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "priority": priority,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class WorkshopId {
  String id;
  String image;
  String title;
  String subTitle;
  double price;
  double mrpPrice;
  String language;
  String duration;

  WorkshopId({
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.mrpPrice,
    required this.language,
    required this.duration,
  });

  factory WorkshopId.fromJson(Map<String, dynamic> json) => WorkshopId(
    id: json["_id"],
    image: json["image"],
    title: json["title"],
    subTitle: json["subTitle"],
    price: json["price"]?.toDouble(),
    mrpPrice: json["mrpPrice"]?.toDouble(),
    language: json["language"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "title": title,
    "subTitle": subTitle,
    "price": price,
    "mrpPrice": mrpPrice,
    "language": language,
    "duration": duration,
  };
}
