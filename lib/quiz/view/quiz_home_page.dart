import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quiz_bloc.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => print('test'),
     child: const QuizHomeView()),
    );
  }
}
