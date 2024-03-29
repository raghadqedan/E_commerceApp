import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class SearchPageTitle extends StatelessWidget {
  final String title;
  final bool needClearAll;
  const SearchPageTitle({super.key, required this.title, this.needClearAll=false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title,style:Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
      needClearAll?TextButton(onPressed: (){}, child: Text('Clear All',style:Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.primary))):const SizedBox()
      
    ],);
  }
}