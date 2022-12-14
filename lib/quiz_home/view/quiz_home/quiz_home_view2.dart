import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:very_good_supabase/quiz_home/bloc/quiz_bloc.dart';

class QuizHomeView2 extends StatelessWidget {
  const QuizHomeView2({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color(int.parse(category.color)),
          child: Center(
            child: SizedBox(
              height: 200,
              // child: state.initialCategory?.image),
              child: Hero(
                tag: 'hero-${category.id}',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(child: category.image),
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
                category.name,
                style: Theme.of(context).textTheme.headline4,
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  context.read<QuizBloc>().add(const QuizStarted());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Quiz Starten!'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
