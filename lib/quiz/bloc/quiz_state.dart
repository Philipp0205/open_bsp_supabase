part of 'quiz_bloc.dart';

enum QuizStatus { success, error, loading }

extension QuizStatusX on QuizStatus {
  bool get isSuccess => this == QuizStatus.success;
}

class QuizState extends Equatable {
  const QuizState({
    required this.initialCategory,
    this.status = QuizStatus.loading,
  });
  
  final Category? initialCategory;
  final QuizStatus status;

  @override
  List<Object> get props => [];
  
}

