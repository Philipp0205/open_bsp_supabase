import 'package:category_repository/category_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_supabase/quiz/bloc/quiz_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  static Route<void> route({Category? initialCategory}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => QuizBloc(),
        child: const CategoryPage(),
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
                color: Colors.blue,
                child: Center(
                    child: SizedBox(height: 200, child: state.category.image)),
              ),
            ],
          );
        },
      ),
    );
  }
}
