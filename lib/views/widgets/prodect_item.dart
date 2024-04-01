import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/favorite_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/view_models.dart/favorites/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItem;
  const ProductItem({super.key, required this.productItem});

  bool isProductFavorite(FavoritesItemModel favoritesItem, ProductItemModel productItem) {
  return favoritesItem.favProductItem.id== productItem.id;
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 110,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.grey2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: productItem.imgUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white54,
                ),
                child: BlocProvider(
                  create: (context) { final favcubit=BlocProvider.of<FavoritesCubit>(context);
                      favcubit.getFavoritesDate();
                      return favcubit;},
              
                  child: BlocBuilder<FavoritesCubit, FavoritesState>(

                    buildWhen:  (previous, current) => current is FavoritesLoaded ||current is FavoritesLoading ||current is FavoritesError || current is Favoritessuccess,
                    builder: (context, state) {
                      final favcubit=BlocProvider.of<FavoritesCubit>(context);
                     
       
                      if(state is FavoritesLoaded){
                       final favoritesItem = state.favorites;
                      return IconButton(
                        onPressed: () {
                       
 // Check if the product is already in the user's favorites
        final isFavorite = favoritesItem.any((item) => isProductFavorite(item, productItem));

        if (isFavorite) {
          // If the product is already a favorite, remove it from favorites
          favcubit.removeFromFavorites(productItem.id); // Assuming you pass the product ID to removeFromFavorites
        } else {
          // If the product is not a favorite, add it to favorites
          favcubit.addToFavorites(productItem); // Assuming you pass the product to addToFavorites
        }                    
                              },
                        icon: Icon(
                          productItem.isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: productItem.isFav ? Colors.red : null,
                        ),
                      );}
                      else{
                         return IconButton(
                        onPressed: () {
                         
                            // Toggle the favorite status
                            

                          //   if (widget.productItem.isFav) {
                          //     // Add the item to favorites list
                          //     print('ppppppA${widget.productItem.isFav}');
                          //     // dummyFaveroits.add(widget.productItem);
                          //   } else {
                          //     // Remove the item from favorites list
                          //     print('ppppppA${widget.productItem.isFav}');
                          //     //  dummyFaveroits.remove(widget.productItem);
                          //   }
                   
                        },
                        icon: Icon(
                          productItem.isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: productItem.isFav ? Colors.red : null,
                        ),
                      );


                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          productItem.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          productItem.category,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.grey,
              ),
        ),
        Text(
          '\$${productItem.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
