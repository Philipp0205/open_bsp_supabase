import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_supabase/categories/bloc/categories_bloc.dart';
import 'package:very_good_supabase/categories/view/widgets/category_card.dart';
import 'package:very_good_supabase/categories/view/widgets/loader.dart';

import '../../quiz_home/view/quiz/quiz_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category')),
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status.isSuccess) {
            return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                primary: false,
                padding: const EdgeInsets.all(20),
                children: state.categories
                    .map(
                      (category) => CategoryCard(
                        text: category.name,
                        id: category.id.toString(),
                        image: category.image!,
                        color: category.color,
                        onTap: () {
                          Navigator.of(context).push(
                            QuizView.route(initialCategory: category),
                          );
                        },
                      ),
                    )
                    .toList());
          } else {
            return const Loader();
          }
        },
      ),
    );
  }
}

class _DebugButton extends StatelessWidget {
  const _DebugButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          context.read<CategoriesBloc>().add(const CategoriesFetched()),
      child: const Text('Debug'),
    );
  }
}
