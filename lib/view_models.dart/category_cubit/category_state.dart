part of 'category_cubit.dart';

 class CategoryState {}

 class CategoryInitial extends CategoryState {}
 
 class CategoryLoading extends CategoryState {}
 
 class CategoryLoaded extends CategoryState {
    final List<CategoryModel> categories;
    CategoryLoaded(this.categories);
 }
 class categoryError extends CategoryState{
 final String message;
 categoryError(this.message);
 }


