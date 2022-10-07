import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supabase_category.g.dart';

/// {@template supabase_category}
/// Supabase category model
/// {@endtemplate}
///
@JsonSerializable()
class SupabaseCategory extends Equatable {
  /// {@macro supabase_category}
  const SupabaseCategory({
    int? id,
    required this.name,
    required this.imageName,
    required this.color,
  }) : id = id ?? 0;

  /// Connect the generated [_$SupabaseUserFromJson] function to the `fromJson`
  /// factory.
  factory SupabaseCategory.fromJson(Map<String, dynamic> json) =>
      _$SupabaseCategoryFromJson(json);

  /// Id of the category.
  final int id;

  /// Name of the category.
  @JsonKey(name: 'name')
  final String name;

  /// Image name of the category.
  @JsonKey(name: 'image_name')
  final String imageName;

  /// Color of the category.
  @JsonKey(name: 'color')
  final String color;

  @override
  List<Object> get props => [id, name, imageName, color];

  /// Empty Supabase object.
  static const empty = SupabaseCategory(
    name: '',
    imageName: '',
    color: '',
  );

  /// Connect the generated [_$SupabaseUserToJson]
  /// function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupabaseCategoryToJson(this);
}
