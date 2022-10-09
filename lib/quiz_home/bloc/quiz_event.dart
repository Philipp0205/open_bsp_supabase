part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch questions.
class QuizFetched extends QuizEvent {
  const QuizFetched();
}

/// Event to move to next page of the quiz.
class QuizNextPage extends QuizEvent {
  const QuizNextPage();
}

/// Event to start the quiz.
class QuizStarted extends QuizEvent {
  const QuizStarted();
}