import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesTapView extends StatelessWidget {
  const CategoriesTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          ListView.builder(
            padding:const EdgeInsets.all(16),
            itemCount:dummyCategories.length ,
            shrinkWrap: true,
            physics: const  NeverScrollableScrollPhysics(),
            itemBuilder:(context, index){
              final categoryItem=dummyCategories[index];
              final item=CategoryItem(name:categoryItem.name,imgurl:categoryItem.img ,index:index);
               return item ;} )
        ],),
      ),
    );
  }
}