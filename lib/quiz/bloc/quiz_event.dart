part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch questions.
class QuizFetched extends QuizEvent {
  const QuizFetched(this.category);

  final Category category;
}
