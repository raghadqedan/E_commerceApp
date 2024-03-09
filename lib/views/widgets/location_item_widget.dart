import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/address_model.dart';


class LocationItemWidget extends StatelessWidget {
  final preferedAddressModel location;

  const LocationItemWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Row(
          children: [
            ClipRRect(  borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                  imageUrl: location.imgurl, height: 0.14 * size.height,width: 0.19 * size.height,),
            
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    location.address,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
