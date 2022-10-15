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

  void _onNextPage(QuizNextPage event, Emitter<QuizState> emit) {
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    final index = state.pageIndex + 1;
    emit(state.copyWith(pageIndex: index));
  }

  FutureOr<void> _onSelectOption(
      QuizOptionSelected event, Emitter<QuizState> emit) {
    emit(
      state.copyWith(
        selectedOption: event.option,
      ),
    );
  }
}
