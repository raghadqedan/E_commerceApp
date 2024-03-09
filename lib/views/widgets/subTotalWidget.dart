import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class SubTotalWidget extends StatelessWidget {
  final  String title;
  final double amount;
  const SubTotalWidget({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Text(title,style:Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.grey)),
      Text('\$${amount.toString()}',style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold))
      
      
      ],),
    );
  }
}