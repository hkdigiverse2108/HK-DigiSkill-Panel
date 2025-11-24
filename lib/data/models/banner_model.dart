enum BannerType { web, app }

class BannerModel {
  final int id;
  final BannerType type;
  final String? title; // web only
  final String? description; // web only
  final String? imagePrimary; // web/app (web primary, app single)
  final String? imageSecondary; // web only
  final String? link; // app only

  BannerModel({
    required this.id,
    required this.type,
    this.title,
    this.description,
    this.imagePrimary,
    this.imageSecondary,
    this.link,
  });

  BannerModel copyWith({
    int? id,
    BannerType? type,
    String? title,
    String? description,
    String? imagePrimary,
    String? imageSecondary,
    String? link,
  }) {
    return BannerModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePrimary: imagePrimary ?? this.imagePrimary,
      imageSecondary: imageSecondary ?? this.imageSecondary,
      link: link ?? this.link,
    );
  }

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int,
      type: (json['type'] as String) == 'app' ? BannerType.app : BannerType.web,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imagePrimary: json['imagePrimary'] as String?,
      imageSecondary: json['imageSecondary'] as String?,
      link: json['link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'title': title,
      'description': description,
      'imagePrimary': imagePrimary,
      'imageSecondary': imageSecondary,
      'link': link,
    };
  }
}
