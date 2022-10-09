import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supabase_question.g.dart';

/// {template supabase_question}
/// Supabase question model
/// {endtemplate}
@JsonSerializable()
class SupabaseQuestion extends Equatable {
  /// {macro supabase_question}
  const SupabaseQuestion({
    int? id,
    required this.categoryId,
    required this.questionText,
    required this.rightAnswer,
    required this.wrongAnswer1,
    required this.wrongAnswer2,
  }) : id = id ?? 0;

  /// Connect the generated [_$SupabaseUserFromJson] function to the `fromJson`
  /// factory.
  factory SupabaseQuestion.fromJson(Map<String, dynamic> json) =>
      _$SupabaseQuestionFromJson(json);

  /// Id of the question.
  final int id;

  /// Category id of the question.
  @JsonKey(name: 'category_id')
  final int categoryId;

  /// Question text of the question
  @JsonKey(name: 'question_text')
  final String questionText;

  /// Right answer text of the question
  @JsonKey(name: 'right_answer')
  final String rightAnswer;

  /// First wrong answer of the question
  @JsonKey(name: 'wrong_answer_1')
  final String wrongAnswer1;

  /// Second wrong answer of the question
  @JsonKey(name: 'wrong_answer_2')
  final String wrongAnswer2;

  @override
  List<Object> get props =>
      [id, categoryId, questionText, rightAnswer, wrongAnswer1, wrongAnswer2];

  /// Empty Supabase object.
  static const empty = SupabaseQuestion(
    categoryId: 0,
    questionText: '',
    rightAnswer: '',
    wrongAnswer1: '',
    wrongAnswer2: '',
  );

  /// Connect the generated [_$SupabaseUserToJson]
  /// function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupabaseQuestionToJson(this);
}
