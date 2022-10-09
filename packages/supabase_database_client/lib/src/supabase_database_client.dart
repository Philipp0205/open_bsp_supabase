import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:supabase_database_client/src/models/supabase_category.dart';
import 'package:supabase_database_client/src/models/supabase_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'models/supabase_question.dart';

/// {@template supabase_database_exception}
/// A generic supabase database exception.
/// {@endtemplate}
abstract class SupabaseDatabaseException implements Exception {
  /// {@macro supabase_database_exception}
  const SupabaseDatabaseException(this.error);

  /// The error which was caught.
  final Object error;
}

/// {@template supabase_user_information_failure}
/// Thrown during the get user information process if a failure occurs.
/// {@endtemplate}
class SupabaseUserInformationFailure extends SupabaseDatabaseException {
  /// {@macro supabase_user_information_failure}
  const SupabaseUserInformationFailure(super.error);
}

/// {@template supabase_update_user_failure}
/// Thrown during the update user information process if a failure occurs.
/// {@endtemplate}
class SupabaseUpdateUserFailure extends SupabaseDatabaseException {
  /// {@macro supabase_update_user_failure}
  const SupabaseUpdateUserFailure(super.error);
}

/// {@template supabase_database_client}
/// Supabase database client
/// {@endtemplate}
class SupabaseDatabaseClient {
  /// {@macro supabase_database_client}
  const SupabaseDatabaseClient({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  /// Method to get the user information by id
  /// from the profiles database on Supabase.
  Future<SupabaseUser> getUserProfile() async {
    try {
      final response = await _supabaseClient
          .from('account')
          .select()
          .eq('id', _supabaseClient.auth.currentUser?.id)
          .single()
          .execute();

      final data = response.data as Map<String, dynamic>;
      return SupabaseUser.fromJson(data);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseUserInformationFailure(error),
        stackTrace,
      );
    }
  }

  /// Method to get all categories from the categories database.
  Future<List<SupabaseCategory>> getCategories() async {
    try {
      // List<SupabaseCategory> categories = [];
      final response =
          await _supabaseClient.from('categories').select().execute();
      final data = response.data as List<dynamic>;

      return data
          .map((category) =>
              SupabaseCategory.fromJson(category as Map<String, dynamic>))
          .map((e) => e)
          .toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseUserInformationFailure(error),
        stackTrace,
      );
    }
  }

  /// Method to update the user information on the profiles database.
  Future<void> updateUser({required SupabaseUser user}) async {
    try {
      final supabaseUser = SupabaseUser(
        id: _supabaseClient.auth.currentUser?.id,
        userName: user.userName,
        companyName: user.companyName,
      );

      await _supabaseClient
          .from('account')
          .upsert(supabaseUser.toJson())
          .execute();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseUpdateUserFailure(error),
        stackTrace,
      );
    }
  }

  /// Method to get image from supabase bucket
  Future<Image> getImageFromDatabase(String imageName) async {
    try {
      final response =
          await _supabaseClient.storage.from('images').download(imageName);

      return Image.memory(response.data!);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseUpdateUserFailure(error),
        stackTrace,
      );
    }
  }

  /// Method to get questions for a specific category.
  /// The category is passed as a parameter.
  Future<List<SupabaseQuestion>> getQuestionsOfCategory(
      SupabaseCategory category) async {
    try {
      final response = await _supabaseClient
          .from('questions')
          .select()
          .eq('category_id', category.id)
          .execute();

      final data = response.data as List<dynamic>;

      return data
          .map((question) =>
              SupabaseQuestion.fromJson(question as Map<String, dynamic>))
          .map((e) => e)
          .toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseUpdateUserFailure(error),
        stackTrace,
      );
    }
  }
}
