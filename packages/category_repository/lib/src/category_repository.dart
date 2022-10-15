import 'dart:ui';

import 'package:category_repository/src/models/category.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:supabase_database_client/supabase_database_client.dart';

import '../category_repository.dart';
import 'models/question.dart';

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

    final result = <Category>[];
    for (final category in categories) {
      final image = await getImageFromDatabase(category.imageName);
      result.add(category.toCategory(image));
    }

    return result;
  }

  /// Method to access the questions of a category.
  Future<List<Question>> getQuestions({required Category category}) async {
    final questions = await _databaseClient.getQuestionsOfCategory(category.id);

    return questions.map((question) => question.toQuestion()).toList();
  }

  /// Method to do signIn.
  Future<void> signIn({required String email, required bool isWeb}) async {
    return _authClient.signIn(email: email, isWeb: isWeb);
  }

  /// Method to do signOut.
  Future<void> signOut() async => _authClient.signOut();

  /// Method to get an image from a supabase bucket.
  Future<Image> getImageFromDatabase(String imageName) async {
    return _databaseClient.getImageFromDatabase(imageName);
  }
}

extension on SupabaseCategory {
  Category toCategory(Image? image) {
    return Category(
      id: id,
      name: name,
      image: image,
      color: color,
    );
  }
}

extension on SupabaseQuestion {
  Question toQuestion() {
    final options = <Option>[
      Option(
        questionId: id,
        text: rightAnswer,
        isCorrect: true,
      ),
      Option(
        questionId: id,
        text: wrongAnswer1,
        isCorrect: false,
      ),
      Option(
        questionId: id,
        text: wrongAnswer2,
        isCorrect: false,
      ),
    ];

    return Question(
      id: id,
      categoryId: categoryId,
      questionText: questionText,
      options: options,
    );
  }
}
