part of 'quiz_bloc.dart';

enum QuizStatus { success, error, loading }

extension QuizStatusX on QuizStatus {
  bool get isSuccess => this == QuizStatus.success;
}

class QuizState extends Equatable {
  const QuizState({
    required this.initialCategory,
    required this.pageIndex,
    required this.progress,
    this.status = QuizStatus.loading,
  });

  final Category? initialCategory;
  final QuizStatus status;
  final int pageIndex;
  final double progress;

  @override
  List<Object> get props => [];

  QuizState copyWith({
    Category? initialCategory,
    QuizStatus? status,
    int? pageIndex,
    double? progress,
  }) {
    return QuizState(
      initialCategory: initialCategory ?? this.initialCategory,
      status: status ?? this.status,
      pageIndex: pageIndex ?? this.pageIndex,
      progress: progress ?? this.progress,
    );
  }
}
