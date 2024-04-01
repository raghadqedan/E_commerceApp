import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/services/categories_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState>  {
    final categoriesServices=CategoriesServicesApiImp();
  CategoryCubit() : super(CategoryInitial());

void getCategoryData() async{
    emit(CategoryLoading());
    try{
        final categories=await categoriesServices.getCategories();
        emit(CategoryLoaded(categories));
    }catch(e){
        emit(categoryError(e.toString()));
    }

}








}
