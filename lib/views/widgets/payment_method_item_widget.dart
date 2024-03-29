import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/payment_model.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class PaymentMethodItemWidget extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  const PaymentMethodItemWidget({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: AppColors.grey

      )),
     child:Row(children: [
      CachedNetworkImage(imageUrl:paymentMethod.imgurl,height: 50,width: 50,fit:BoxFit.fill ),
      const SizedBox(width: 16,),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
   
    Text(paymentMethod.name,style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
     Text(paymentMethod.cardNumber,style:Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.grey)),

],),
const Spacer(),
const Icon(Icons.chevron_right,color: AppColors.grey,)
     ],)
      ),

      
        
      );
   
  }
}