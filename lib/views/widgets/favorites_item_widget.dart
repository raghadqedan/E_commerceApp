import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/favorite_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class FavoritesitemWidget extends StatefulWidget {
  final List<ProductItemModel> favorites;
 FavoritesitemWidget({super.key,required this.favorites});

  @override
  State<FavoritesitemWidget> createState() => _FavoritesitemWidgetState();
}

class _FavoritesitemWidgetState extends State<FavoritesitemWidget> {
  @override
  Widget build(BuildContext context) {
    return     widget.favorites.isNotEmpty? GridView.builder(
                itemCount:  widget.favorites.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: ((context, index) {
                  final productItem= widget.favorites[index];
                  return   Column(
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
                decoration: const  BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white54,
                ),
                child: IconButton(
                  onPressed: () {
                    setState((){
                 print('ffff${productItem.isFav}');
                    productItem.isFav=false;
                    dummyFaveroits.remove(productItem);
                      print('ffff${productItem.isFav}');
                
                
                  });},
                 
                  icon:productItem.isFav?const Icon(Icons.favorite,color:AppColors.red):const Icon(Icons.favorite_border),
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
  })
    ):const Padding(
      padding:  EdgeInsets.only(top: 180),
      child: Text('No Favorite Items '),
    );
  }
}