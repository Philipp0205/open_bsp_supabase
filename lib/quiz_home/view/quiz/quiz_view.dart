import 'dart:ffi';

import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_supabase/quiz_home/bloc/quiz_bloc.dart';
import 'package:very_good_supabase/quiz_home/view/question/question_view.dart';
import 'package:very_good_supabase/quiz_home/view/quiz_home/quiz_home_view2.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  static Route<void> route({Category? initialCategory}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => QuizBloc(
          initialCategory: initialCategory,
          categoryRepository: context.read<CategoryRepository>(),
        )..add(const QuizFetched()),
        child: const QuizView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<QuizBloc, QuizState>(
          buildWhen: (previous, current) =>
              previous.progress != current.progress,
          builder: (context, state) {
            return _buildProgressBar(state);
          },
        ),
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: state.pageController,
            itemBuilder: (context, index) {
              return BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  if (index == 0) {
                    return QuizHomeView2(category: state.initialCategory!);
                  } else if (index <=
                      state.initialCategory!.questions.length - 1) {
                    return QuestionView(
                      question:
                          state.initialCategory!.questions[state.pageIndex],
                      category: state.initialCategory!,
                    );
                  } else {
                    return Text('Result');
                  }
                },
              );
            },
          );
        },
      ),
    );
  }

  DecoratedBox _buildProgressBar(QuizState state) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LinearProgressIndicator(
          minHeight: 10,
          value: state.progress,
          semanticsLabel: 'Linear progress indicator',
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          backgroundColor: const Color(0xff4c566a),
        ),
      ),
    );
  }
}
