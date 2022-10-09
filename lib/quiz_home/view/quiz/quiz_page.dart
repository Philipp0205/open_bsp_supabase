import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_supabase/quiz_home/bloc/quiz_bloc.dart';
import 'package:very_good_supabase/quiz_home/view/quiz/quiz_view.dart';


class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(initialCategory: null)
      ..add(const QuizFetched()),
      child: const QuizView(),
    ) ;
  }

}
