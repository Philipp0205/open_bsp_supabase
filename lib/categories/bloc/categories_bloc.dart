import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this._categoriesRepository) : super(const CategoriesState()) {
    on<CategoriesFetched>(_onFetchCategories);
  }

  final CategoryRepository _categoriesRepository;

  Future<void> _onFetchCategories(
      CategoriesFetched event, Emitter<CategoriesState> emit) async {
    try {
      // emit(CategoriesLoading());
      final categories = await _categoriesRepository.getCategories();
      emit(
        state.copyWith(categories: categories, status: CategoryStatus.success),
      );
    } catch (error) {
      addError(error);
    }
  }

  void getImageFromDatabase(String imageName) {
    _categoriesRepository.getImageFromDatabase(imageName);
  }
}
