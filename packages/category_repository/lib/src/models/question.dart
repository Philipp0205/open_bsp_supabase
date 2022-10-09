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
    required this.rightAnswer,
    required this.wrongAnswer1,
    required this.wrongAnswer2,
  });

  static const Question empty = Question(
    id: 0,
    categoryId: 0,
    questionText: '',
    rightAnswer: '',
    wrongAnswer1: '',
    wrongAnswer2: '',
  );

  /// The question's id.
  final int id;

  /// The question's category id.
  final int categoryId;

  /// The question's text.
  final String questionText;

  /// The question's right answer.
  final String rightAnswer;

  /// The question's first wrong answer.
  final String wrongAnswer1;

  /// The question's second wrong answer.
  final String wrongAnswer2;

  @override
  List<Object> get props =>
      [id, categoryId, questionText, rightAnswer, wrongAnswer1, wrongAnswer2];
}
