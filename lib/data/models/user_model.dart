class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  // Add these methods for serialization
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json['id'], name: json['name'], email: json['email']);
}
