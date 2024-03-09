import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/view_models.dart/product_details/product_details_cubit.dart';
import 'package:ecommerce_app/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))
            ],
          ),
          body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            bloc: cubit,
            buildWhen: (previous, current) =>
                current is ProductDetailsInitial ||
                current is ProductDetailsLoaded ||
                current is ProductDetailsLoading,
            builder: (context, state) {
              if (state is ProductDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is ProductDetailsError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is ProductDetailsError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is ProductDetailsLoaded) {
                final productItem = state.prodect;
                return Stack(children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.5,
                    color: AppColors.grey2,
                    child: CachedNetworkImage(
                        imageUrl: productItem.imgUrl, fit: BoxFit.contain),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: (size.height * 0.40)),
                    child: SizedBox(
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(productItem.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: AppColors.orange,
                                            ),
                                            Text(
                                                productItem.averageRate
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                            
                                          ],
                                        )
                                      ],
                                    ),
                                  BlocBuilder<ProductDetailsCubit,
                                  ProductDetailsState>(
                                bloc: cubit,
                                buildWhen: (previous, current) =>
                                    current is QuantityChanged,
                                builder: (context, state) {
                                  if (state is QuantityChanged) {
                                    final counter = state.quantity;
                                    return CounterWidget(
                                      cubit: cubit,
                                      counter: counter,
                                    );
                                  } else {
                                    return CounterWidget(
                                      cubit: cubit,
                                      counter: 1,
                                    );
                                  }
                                },
                              ),
                            ],
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Text("Size",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                SizedBox(height: size.height * .01),
                                 Row(
                            children: ProductSize.values
                                .map(
                                  (size) => BlocBuilder<ProductDetailsCubit,
                                      ProductDetailsState>(
                                    bloc: cubit,
                                    buildWhen: (previous, current) =>
                                        current is SizedChanged,
                                    builder: (context, state) {
                                      if (state is SizedChanged) {
                                        final selectedSize = state.size;
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  end: 8.0),
                                          child: InkWell(
                                            onTap: () => cubit.changeSize(size),
                                            child: CircleAvatar(
                                              radius: 23,
                                              backgroundColor:
                                                  selectedSize == size
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : AppColors.grey2,
                                              child: Center(
                                                child: Text(
                                                  size.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: selectedSize ==
                                                                size
                                                            ? AppColors.white
                                                            : null,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  end: 8.0),
                                          child: InkWell(
                                            onTap: () => cubit.changeSize(size),
                                            child: CircleAvatar(
                                              radius: 23,
                                              backgroundColor: AppColors.grey2,
                                              child: Center(
                                                child: Text(
                                                  size.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                                .toList(),),
                                //const  SizedBox(height: 8,),
                                SizedBox(height: size.height * .01),
                                Text("Description",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                SizedBox(height: size.height * .01),
                                ReadMoreText(
                                  productItem.description,
                                  trimLines: 5,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: AppColors.grey),
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  lessStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$${productItem.price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold)),
                                    BlocConsumer<ProductDetailsCubit,
                                        ProductDetailsState>(
                                           bloc: cubit,
                                          listenWhen: ((previous, current) => current is AddingToCartError),
                                 listener: (context, state) {
                                    if (state is AddingToCartError) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Alert!'),
                                            content: const Text('You must select a size before adding to cart!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () { Navigator.pop(context);},
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );}
                                 },




                                      buildWhen: ((previous, current) =>
                                          current is AddingToCart ||
                                          current is AddedToCart
                                          ||current is AddingToCartError),
                                      builder: (context, state) {
                                        if (state is AddingToCart) {
                                          return ElevatedButton(
                                              onPressed: null,
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(.5),
                                                  foregroundColor:
                                                      AppColors.white),
                                              child: const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(),
                                              ));
                                        } else if (state is AddedToCart) {
                                          return ElevatedButton(
                                            onPressed: null,
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                foregroundColor:
                                                    AppColors.white),
                                            child: const Text('Added'),
                                          );
                                        } else {
                                          return ElevatedButton(
                                            onPressed: () async {
                                              await cubit
                                                  .addToCart(productItem.id);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                foregroundColor:
                                                    AppColors.white),
                                            child: Text('Add To Cart'),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                  )
                ]);
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
