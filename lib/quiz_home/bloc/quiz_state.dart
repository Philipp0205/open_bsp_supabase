part of 'quiz_bloc.dart';

enum QuizStatus { success, error, loading }

extension QuizStatusX on QuizStatus {
  bool get isSuccess => this == QuizStatus.success;
}

class QuizState extends Equatable {
  const QuizState({
    this.initialCategory,
    required this.pageIndex,
    required this.progress,
    this.status = QuizStatus.loading,
    required this.pageController,
    this.selectedOption = Option.empty,
  });

  final Category? initialCategory;
  final Option selectedOption;
  final QuizStatus status;
  final int pageIndex;
  final double progress;
  final PageController pageController;

  @override
  List<Object> get props => [selectedOption, pageIndex, progress];

  QuizState copyWith({
    Category? initialCategory,
    Option? selectedOption,
    QuizStatus? status,
    int? pageIndex,
    double? progress,
    PageController? pageController,
  }) {
    return QuizState(
      initialCategory: initialCategory ?? this.initialCategory,
      selectedOption: selectedOption ?? this.selectedOption,
      status: status ?? this.status,
      pageIndex: pageIndex ?? this.pageIndex,
      progress: progress ?? this.progress,
      pageController: pageController ?? this.pageController,
    );
  }
}
