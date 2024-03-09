import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';


class CheckoutCartItemWidget extends StatelessWidget {
  final CartOrdersModel cartItem;
  const CheckoutCartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: AppColors.grey2),
              child: CachedNetworkImage(
                  imageUrl: cartItem.product.imgUrl, height:120,width:120,fit: BoxFit.fill,)),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.product.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Quntity: ',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w600, color: AppColors.grey)),
                        TextSpan(
                            text: cartItem.quantity.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w600)),
                      ])),
                       Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Size: ',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w600, color: AppColors.grey)),
                        TextSpan(
                            text: cartItem.size.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w600)),
                      ])),
          
                    ],
                  ),
                 const  SizedBox(width: 90,),
                   Text('\$${cartItem.totalPrice}', style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w600,color: AppColors.primary))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
