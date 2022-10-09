import 'package:category_repository/category_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_supabase/quiz_home/view/quiz_home/quiz_home_view2.dart';

import '../../bloc/quiz_bloc.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  static Route<void> route({Category? initialCategory}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => QuizBloc(initialCategory: initialCategory),
        child: const QuizView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return PageView.builder(
            itemBuilder: (context, index) {
              return BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  if (index == 0) {
                    return QuizHomeView2(category: state.initialCategory!);
                  } else if (index == 1) {
                    return Text('Quiz Page');
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
}
