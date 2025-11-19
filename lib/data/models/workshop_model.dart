class WorkshopModel {
  final int id;
  final String name;
  final String? description;
  final String image;
  final String instructor;
  final DateTime startDate;
  final DateTime endDate;
  final int maxParticipants;
  final int currentParticipants;
  final bool isFeatured;
  final double price;
  final String? location;
  final String? category;

  WorkshopModel({
    required this.id,
    required this.name,
    this.description,
    required this.image,
    required this.instructor,
    required this.startDate,
    required this.endDate,
    required this.maxParticipants,
    this.currentParticipants = 0,
    this.isFeatured = false,
    this.price = 0.0,
    this.location,
    this.category,
  });

  // Add fromJson and toJson methods if needed for API integration
  factory WorkshopModel.fromJson(Map<String, dynamic> json) {
    return WorkshopModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      instructor: json['instructor'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      maxParticipants: json['maxParticipants'],
      currentParticipants: json['currentParticipants'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
      price: (json['price'] ?? 0).toDouble(),
      location: json['location'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'instructor': instructor,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'maxParticipants': maxParticipants,
      'currentParticipants': currentParticipants,
      'isFeatured': isFeatured,
      'price': price,
      'location': location,
      'category': category,
    };
  }

  // Create a copyWith method for immutability
  WorkshopModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    String? instructor,
    DateTime? startDate,
    DateTime? endDate,
    int? maxParticipants,
    int? currentParticipants,
    bool? isFeatured,
    double? price,
    String? location,
    String? category,
  }) {
    return WorkshopModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      instructor: instructor ?? this.instructor,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      currentParticipants: currentParticipants ?? this.currentParticipants,
      isFeatured: isFeatured ?? this.isFeatured,
      price: price ?? this.price,
      location: location ?? this.location,
      category: category ?? this.category,
    );
  }
}
