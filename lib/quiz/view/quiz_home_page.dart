import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_supabase/quiz/bloc/quiz_bloc.dart';

import 'quiz_home_view.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => QuizBloc(initialCategory: null)
            ..add(const QuizFetched()),
      child: const QuizHomeView(),
    ) ;
  }
}
