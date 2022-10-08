import 'package:category_repository/category_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quiz_bloc.dart';

class QuizHomeView extends StatelessWidget {
  const QuizHomeView({super.key});

  static Route<void> route({Category? initialCategory}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => QuizBloc(initialCategory: initialCategory),
        child: const QuizHomeView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color(int.parse(state.initialCategory!.color)),
                child: Center(
                  child: SizedBox(
                    height: 200,
                    // child: state.initialCategory?.image),
                    child: Hero(
                      tag: 'hero-${state.initialCategory?.id}',
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: state.initialCategory?.image),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      state.initialCategory?.name ?? '',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Divider(),
                    ElevatedButton(
                        onPressed: () => print('test'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.play_arrow),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Quiz Starten!'),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
