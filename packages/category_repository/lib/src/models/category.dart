import 'package:category_repository/src/models/question.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

/// {@template category}
/// A object which represents a specific category.
/// {@endtemplate}
class Category extends Equatable {
  /// @macro {@macro category}
  const Category({
    required this.id,
    this.name = '',
    this.imageName = '',
    this.color = '',
    this.questions = const [],
    required this.image,
  });

  static const Category empty = Category(id: 0, image: null);

  /// The category's id.
  final int id;

  /// The category's name.
  final String name;

  /// The category's image name.
  final String imageName;

  /// The category's color.
  final String color;

  /// The category's image.
  final Image? image;

  /// The category's questions
  final List<Question> questions;

  @override
  List<Object> get props => [id, name, imageName, color, questions];

  Category copyWith({
    int? id,
    String? name,
    String? imageName,
    String? color,
    Image? image,
    List<Question>? questions,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imageName: imageName ?? this.imageName,
      color: color ?? this.color,
      image: image ?? this.image,
      questions: questions ?? this.questions,
    );
  }
}
