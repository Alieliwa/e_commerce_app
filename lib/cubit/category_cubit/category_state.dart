part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySucsses extends CategoryState {
  CategoryData? categoryData;
  CategorySucsses(this.categoryData);
}
final class CategoryError extends CategoryState {
  String? error;
  CategoryError(this.error);
}
