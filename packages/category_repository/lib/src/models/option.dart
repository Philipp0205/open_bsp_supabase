import 'package:equatable/equatable.dart';

/// template option
/// A object which represents a option of a question.
/// {@endtemplate}
class Option extends Equatable {
  /// macro {@macro option}
  const Option({
    required this.questionId,
    required this.text,
    required this.isCorrect,
  });

  static const Option empty = Option(
    questionId: 0,
    text: '',
    isCorrect: false,
  );

  /// The option's question id.
  final int questionId;

  /// The option's text.
  final String text;

  /// The option's isCorrect.
  final bool isCorrect;

  @override
  List<Object> get props => [questionId, text, isCorrect];

  Option copyWith({
    int? questionId,
    String? text,
    bool? isCorrect,
  }) {
    return Option(
      questionId: questionId ?? this.questionId,
      text: text ?? this.text,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}
