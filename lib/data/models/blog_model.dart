import 'package:flutter/material.dart';

class BlogModel {
  final int id;
  final String title;
  final String? subtitle;
  final DateTime date;
  final bool isFeatured;
  final String content;
  final String coverImage;
  final String mainImage;
  final String? quote;
  final String authorName;

  BlogModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.date,
    this.isFeatured = false,
    required this.content,
    required this.coverImage,
    required this.mainImage,
    this.quote,
    required this.authorName,
  });

  BlogModel copyWith({
    int? id,
    String? title,
    String? subtitle,
    DateTime? date,
    bool? isFeatured,
    String? content,
    String? coverImage,
    String? mainImage,
    String? quote,
    String? authorName,
  }) {
    return BlogModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      date: date ?? this.date,
      isFeatured: isFeatured ?? this.isFeatured,
      content: content ?? this.content,
      coverImage: coverImage ?? this.coverImage,
      mainImage: mainImage ?? this.mainImage,
      quote: quote ?? this.quote,
      authorName: authorName ?? this.authorName,
    );
  }

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      date: DateTime.parse(json['date'] as String),
      isFeatured: json['isFeatured'] as bool? ?? false,
      content: json['content'] as String,
      coverImage: json['coverImage'] as String,
      mainImage: json['mainImage'] as String,
      quote: json['quote'] as String?,
      authorName: json['authorName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'date': date.toIso8601String(),
      'isFeatured': isFeatured,
      'content': content,
      'coverImage': coverImage,
      'mainImage': mainImage,
      'quote': quote,
      'authorName': authorName,
    };
  }
}
