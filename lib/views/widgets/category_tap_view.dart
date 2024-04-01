import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/view_models.dart/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/view_models.dart/home/home_cubit.dart';
import 'package:ecommerce_app/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoriesTapView extends StatelessWidget {
  const CategoriesTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) {
        final cubit=CategoryCubit();
        cubit.getCategoryData();
        return cubit;
      },

      child: BlocBuilder<CategoryCubit,CategoryState>(
       buildWhen: (previous, current) => current is CategoryLoading || current is CategoryLoaded|| current is categoryError,
        builder:(context, state) {
       if(state is CategoryLoading){
return  const Center(child: CircularProgressIndicator.adaptive(),);}
else if(state is categoryError){
return Center(child: Text(state.message),);}
else if(state is CategoryLoaded)
{  final categories=state.categories;
  return Center( 
        child : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListView.builder(
    
                padding:const EdgeInsets.all(16),
                itemCount:state.categories.length ,
                shrinkWrap: true,
                physics: const  NeverScrollableScrollPhysics(),
                itemBuilder:(context, index){
                  final categoryItem=categories[index];
                  final item=CategoryItem(name:categoryItem.name,imgurl:categoryItem.imgurl ,index:index);
                   return item ;} )
            ],),
          ),
        ),
      );}
      else{
        return SizedBox();
      }
      }
      
    ));
  }
}