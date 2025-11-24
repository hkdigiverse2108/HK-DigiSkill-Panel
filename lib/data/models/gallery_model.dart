class GalleryModel {
  final int id;
  final String title;
  final List<String> images; // urls
  final String? description;

  GalleryModel({
    required this.id,
    required this.title,
    required this.images,
    this.description,
  });

  GalleryModel copyWith({
    int? id,
    String? title,
    List<String>? images,
    String? description,
  }) {
    return GalleryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      images: images ?? this.images,
      description: description ?? this.description,
    );
  }

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'] as int,
      title: json['title'] as String,
      images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
      'description': description,
    };
  }
}
