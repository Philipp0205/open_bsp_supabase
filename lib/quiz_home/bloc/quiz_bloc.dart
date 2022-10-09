import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:category_repository/category_repository.dart';
import 'package:flutter/cupertino.dart';

part 'quiz_state.dart';

part 'quiz_event.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required this.categoryRepository, required this.initialCategory})
      : super(
          QuizState(
            initialCategory: initialCategory,
            pageIndex: 0,
            progress: 0,
          ),
        ) {
    on<QuizFetched>(_onFetchQuiz);
  }

  final PageController pageController = PageController();
  final CategoryRepository categoryRepository;
  final Category? initialCategory;

  Future<void> _onFetchQuiz(QuizFetched event, Emitter<QuizState> emit) async {
    try {
      final questions = await categoryRepository.getQuestions(
        category: state.initialCategory!,
      );

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
}
