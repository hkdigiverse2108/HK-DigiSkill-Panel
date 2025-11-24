class TestimonialModel {
  final int id;
  final String name;
  final String designation;
  final String? description;
  final String? image;
  final int rate; // 1-5
  final bool isFeatured;

  TestimonialModel({
    required this.id,
    required this.name,
    required this.designation,
    this.description,
    this.image,
    required this.rate,
    this.isFeatured = false,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) {
    return TestimonialModel(
      id: json['id'],
      name: json['name'],
      designation: json['designation'],
      description: json['description'],
      image: json['image'],
      rate: (json['rate'] ?? 0).toInt(),
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'description': description,
      'image': image,
      'rate': rate,
      'isFeatured': isFeatured,
    };
  }

  TestimonialModel copyWith({
    int? id,
    String? name,
    String? designation,
    String? description,
    String? image,
    int? rate,
    bool? isFeatured,
  }) {
    return TestimonialModel(
      id: id ?? this.id,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      description: description ?? this.description,
      image: image ?? this.image,
      rate: rate ?? this.rate,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }
}
