import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_supabase/categories/bloc/categories_bloc.dart';
import 'package:very_good_supabase/categories/view/category_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: CategoryPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(context.read<CategoryRepository>())
        ..add(const CategoriesFetched()),
      child: const CategoryView(),
    );
  }
}
