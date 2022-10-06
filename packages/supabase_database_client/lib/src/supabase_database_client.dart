import 'package:supabase_database_client/src/models/supabase_category.dart';
import 'package:supabase_database_client/src/models/supabase_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

      // for (final category in data) {
      //   categories
      //       .add(SupabaseCategory.fromJson(category as Map<String, dynamic>));
      // }
      // List<SupabaseCategory> categories = data
      //     .map((category) =>
      //         SupabaseCategory.fromJson(category as Map<String, dynamic>))
      //     .toList();

      return data
          .map((category) =>
              SupabaseCategory.fromJson(category as Map<String, dynamic>))
          .map((e) => e as SupabaseCategory)
          .toList();

      // return data as List<SupabaseCategory>;
      // return List.empty();
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

// Future<SupabaseCategory> getCategories() async {
//   try {
//     /// Get the categories from the database.
//     final response = await _supabaseClient
//         .from('categories')
//         .select()
//         .execute();
//
//     final data = response.data as Map<String, dynamic>;
//     return SupabaseCategory.fromJson(data);
//   } catch (error, stackTrace) {
//     Error.throwWithStackTrace(
//       SupabaseUserInformationFailure(error),
//       stackTrace,
//     );
//   }
// }
}