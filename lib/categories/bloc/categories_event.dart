part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch categories.
class CategoriesFetched extends CategoriesEvent {
  const CategoriesFetched();
}