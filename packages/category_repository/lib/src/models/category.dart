import 'dart:ui';
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

  @override
  List<Object> get props => [id, name, imageName, color];
}
