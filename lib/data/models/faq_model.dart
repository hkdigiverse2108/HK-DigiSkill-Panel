class FaqModel {
  final String id;
  final String question;
  final String answer;
  final bool isFeatured;
  final String type;

  final LearningCatalogRef? learningCatalog; // dynamic reference

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.type,
    required this.isFeatured,
    this.learningCatalog,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json["_id"],
      question: json["question"],
      answer: json["answer"],
      type: json["type"],
      isFeatured: json["isFeatured"] ?? false,
      learningCatalog: json["learningCatalogId"] != null
          ? LearningCatalogRef.fromJson(json["learningCatalogId"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "answer": answer,
    "type": type,
    "isFeatured": isFeatured,
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
