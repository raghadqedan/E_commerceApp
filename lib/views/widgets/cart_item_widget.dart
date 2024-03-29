import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/view_models.dart/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/views/widgets/counter_widget.dart';

class CartItemWidget extends StatelessWidget {
  final CartOrdersModel cartItem;

  const CartItemWidget({super.key, required this.cartItem});
  
  @override
  Widget build(BuildContext context) {
    final cartCubit= BlocProvider.of<CartCubit>(context);
  
    return Column(
      children: [
        SizedBox(
          height: 110,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(alignment: AlignmentDirectional.center, children: [
              CachedNetworkImage(
                imageUrl: cartItem.product.imgUrl,
              ),
               PositionedDirectional(
                  end: 8,
                  top: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.red.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 30,
                      ),
                      color: AppColors.red,
                       onPressed: () =>
                         cartCubit.removeFromCart(cartItem.id),
                    ),
                  ),
                ),
              PositionedDirectional(
                  start: 8,
                  bottom: 8,
                  child: BlocBuilder<CartCubit, CartState>(
                    bloc: cartCubit,
                    buildWhen: (previous, current) =>(current is QuantityCounterError)
                      ||  (current is QuantityCounterLoading &&
                            current.cartOrderId == cartItem.id) ||
                        (current is QuantityCounterLoaded &&
                            current.cartOrder.id == cartItem.id),
                    builder: (context, state) {
                      if (state is QuantityCounterLoaded) {
                        return CounterWidget(
                          cubit: BlocProvider.of<CartCubit>(context),
                          counter: state.value,
                          cartOrder: state.cartOrder,
                          // productItem: addToCartItem.product,
                        );
                      } else if (state is CartLoaded) {
                        return CounterWidget(
                            cubit: BlocProvider.of<CartCubit>(context),
                            // productItem: addToCartItem.product,
                            cartOrder: cartItem,
                            counter: state.cartItems
                                .firstWhere(
                                  (item) => item.id == cartItem.id,
                                )
                                .quantity);
                      } else if (state is QuantityCounterLoading) {
                        return  CounterWidget(
                          isLoading: true,
                        );
                      } else {
                        return CounterWidget(
                            cubit: BlocProvider.of<CartCubit>(context),
                            // productItem: addToCartItem.product,
                            cartOrder: cartItem,
                            counter: 1);
                      }
                    },
                  ),
                )
            ]),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.product.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Size: ',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.grey)),
                  TextSpan(
                      text: cartItem.size.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600))
                ]))
              ],
            ),
           BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) => (current is QuantityCounterLoaded &&
                            current.cartOrder.id == cartItem.id),
              builder: (context, state) {
                if(state is QuantityCounterLoaded ){
                return Text('\$ ${state.cartOrder.totalPrice.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600));}
                        else{
                       return  Text('\$ ${cartItem.totalPrice.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600));
                        }
              },
            ),

          ],
        )
      ],
    );
  }
}
