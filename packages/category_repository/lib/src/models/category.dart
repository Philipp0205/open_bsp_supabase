import 'package:equatable/equatable.dart';

/// {@template category}
/// A object which represents a specific category.
/// {@endtemplate}
class Category extends Equatable {
  /// @macro {@macro category}
  const Category({required this.id, this.name = ''});

  static const Category empty = Category(id: 0);

  /// The category's id.
  final int id;

  /// The category's name.
  final String name;

  @override
  List<Object> get props => [id, name];
}
