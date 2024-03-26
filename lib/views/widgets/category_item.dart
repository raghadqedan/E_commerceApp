import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  final String name;
  final String imgurl;
  final int index;
  const CategoryItem({super.key, required this.name, required this.imgurl, required this.index,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Card(
       //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 6,
        color:AppColors.grey2,
        child: Stack(children: [
         ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(imageUrl:imgurl,width:double.infinity ,height: 145,
          fit: BoxFit.cover,),
        ),
        Positioned(
          top: 30,
          left:index%2==0?20:240,
          child: Text(name,style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold,fontSize: 25),))
      ],),),
    );
  }
}