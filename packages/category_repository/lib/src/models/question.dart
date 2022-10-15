import 'package:category_repository/src/models/option.dart';
import 'package:equatable/equatable.dart';

/// {@template question}
/// A object which represents a specific question.
/// {@endtemplate}
class Question extends Equatable {
  /// @macro {@macro question}
  const Question({
    required this.id,
    required this.categoryId,
    required this.questionText,
    required this.options,
  });

  static const Question empty = Question(
    id: 0,
    categoryId: 0,
    questionText: '',
    options: [],
  );

  /// The question's id.
  final int id;

  /// The question's category id.
  final int categoryId;

  /// The question's text.
  final String questionText;

  final List<Option> options;

  @override
  List<Object> get props => [id, categoryId, questionText, options];

  Question copyWith({
    int? id,
    int? categoryId,
    String? questionText,
    List<Option>? options,
  }) {
    return Question(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      questionText: questionText ?? this.questionText,
      options: options ?? this.options,
    );
  }
}
