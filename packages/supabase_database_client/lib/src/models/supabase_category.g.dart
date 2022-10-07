// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupabaseCategory _$SupabaseCategoryFromJson(Map<String, dynamic> json) =>
    SupabaseCategory(
      id: json['id'] as int?,
      name: json['name'] as String,
      imageName: json['image_name'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$SupabaseCategoryToJson(SupabaseCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_name': instance.imageName,
      'color': instance.color,
    };
