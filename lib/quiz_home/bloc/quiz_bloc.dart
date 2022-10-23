import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required this.categoryRepository, required this.initialCategory})
      : super(
          QuizState(
            initialCategory: initialCategory,
            pageIndex: 0,
            progress: 0,
            pageController: PageController(),
          ),
        ) {
    on<QuizFetched>(_onFetchQuiz);
    on<QuizNextPage>(_onNextPage);
    on<QuizOptionSelected>(_onSelectOption);
    on<QuizStarted>(_onStartQuiz);
  }

  final CategoryRepository categoryRepository;
  final Category? initialCategory;

  Future<void> _onFetchQuiz(QuizFetched event, Emitter<QuizState> emit) async {
    try {
      final questions = await categoryRepository.getQuestions(
        category: state.initialCategory!,
      );

      /// Order of options for a questions always random.
      for (final question in questions) {
        question.options.shuffle();
      }

      emit(
        state.copyWith(
          initialCategory:
              state.initialCategory?.copyWith(questions: questions),
          status: QuizStatus.success,
        ),
      );
    } catch (error) {
      addError(error);
    }
  }

  /// Move to next page of the quiz.
  /// If the current page is the last page, then the quiz is finished.
  void _onNextPage(QuizNextPage event, Emitter<QuizState> emit) {
    final index = state.pageIndex + 1;
    final progress =
        index / state.initialCategory!.questions.length;

    state.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    emit(state.copyWith(pageIndex: index, progress: progress));
  }

  /// Start the quiz.
  void _onStartQuiz(QuizStarted event, Emitter<QuizState> emit) {
    final progress = state.pageIndex / state.initialCategory!.questions.length;

    state.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    emit(state.copyWith(progress: progress));
  }

  /// Select an option for a question.
  FutureOr<void> _onSelectOption(
      QuizOptionSelected event, Emitter<QuizState> emit) {
    emit(
      state.copyWith(
        selectedOption: event.option,
      ),
    );
  }
}
