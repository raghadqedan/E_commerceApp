import 'package:ecommerce_app/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

void getCategoryData(){
    emit(CategoryLoading());
    try{
        Future.delayed(Duration(seconds: 2));
        final categories=dummyCategories;
        emit(CategoryLoaded(categories));
    }catch(e){
        emit(categoryError(e.toString()));
    }

}








}
