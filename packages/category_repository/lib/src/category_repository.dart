import 'package:category_repository/src/models/category.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:supabase_database_client/supabase_database_client.dart';

// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// {@template category_repository}
/// A package which manages the categories.
/// {@endtemplate}
class CategoryRepository {
  final SupabaseAuthClient _authClient;
  final SupabaseDatabaseClient _databaseClient;

  /// {@macro category_repository}
  const CategoryRepository({
    required SupabaseAuthClient authClient,
    required SupabaseDatabaseClient databaseClient,
  })  : _authClient = authClient,
        _databaseClient = databaseClient;

  /// Method to access the current category.
  Future<List<Category>> getCategories() async {
    final categories = await _databaseClient.getCategories();
    return categories.map((category) => category.toCategory()).toList();
  }

  /// Method to update user information on profiles database.
  // Future<void> updateCategory({required Category category}) {
  //   return _databaseClient.updateCategory(
  //       category: category.toSupabaseCategory());
  // }

  /// Method to do signIn.
  Future<void> signIn({required String email, required bool isWeb}) async {
    return _authClient.signIn(email: email, isWeb: isWeb);
  }

  /// Method to do signOut.
  Future<void> signOut() async => _authClient.signOut();
}

extension on SupabaseCategory {
  Category toCategory() {
    return Category(
      id: id,
      name: name,
    );
  }
}
