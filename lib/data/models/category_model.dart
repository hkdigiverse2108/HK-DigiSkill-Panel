class CategoryModel {
  final int id;
  final String name;
  final String? description;
  final String image;
  final int courseCount;
  final bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    this.description,
    required this.image,
    required this.courseCount,
    required this.isFeatured,
  });
}
