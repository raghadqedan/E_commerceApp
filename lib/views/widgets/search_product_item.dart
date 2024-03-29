import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/search_model.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class PopularSearchproductItem extends StatelessWidget {
  final SearchItemModel item;
  const PopularSearchproductItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
    Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),child:CachedNetworkImage(imageUrl: item.product.imgUrl,fit: BoxFit.contain,height: 100,width: 120,),),
    const SizedBox(width: 8,),
    Row(
      children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(item.product.name,style:Theme.of(context).textTheme.titleMedium),
      const   SizedBox(height: 6,),
        Text('${item.numberOfSearch}K Search Today',style:Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.grey)),

      ],),
      const SizedBox(width: 25,),
       SizedBox(
      
    
         
      child: DecoratedBox(decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.2),borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(item.state),
          )),
        ],
      ),),

      ),



    ],)
    ],);
  }
}