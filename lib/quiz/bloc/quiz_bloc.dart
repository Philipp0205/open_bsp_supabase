import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState(category: category)) {
    on<QuizFetched>(_onFetchQuiz);
  }

  void _onFetchQuiz(QuizFetched event, Emitter<QuizState> emit) {}
}
