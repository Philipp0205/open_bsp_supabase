part of 'categories_bloc.dart';

enum CategoryStatus { success, error, loading }

extension CategoryStatusX on CategoryStatus {
  bool get isSuccess => this == CategoryStatus.success;
  // bool get isError => this == CategoryStatus.error;
  // bool get isLoading => this == CategoryStatus.loading;
}

class CategoriesState extends Equatable {
  const CategoriesState({
    this.categories = const [],
    this.status = CategoryStatus.loading,
  });

  final List<Category> categories;
  final CategoryStatus status;

  @override
  List<Object> get props => [categories];

  CategoriesState copyWith({
    List<Category>? categories,
    CategoryStatus? status,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }
}
