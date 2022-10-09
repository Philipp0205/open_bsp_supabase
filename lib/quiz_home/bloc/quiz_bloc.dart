import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:category_repository/category_repository.dart';
import 'package:flutter/cupertino.dart';

part 'quiz_state.dart';

part 'quiz_event.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required Category? initialCategory})
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

  void _onFetchQuiz(QuizFetched event, Emitter<QuizState> emit) {}
}
