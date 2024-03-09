import 'package:flutter/material.dart';
class CheckoutTitleWidget extends StatelessWidget {
  final String title;
  final int? numperOfProduct;
  final VoidCallback? onEdit;
  const CheckoutTitleWidget({super.key, required this.title,  this.numperOfProduct,this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
 Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                if(numperOfProduct!=null)
                Text(' ($numperOfProduct) ', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),)
              ],
            ),
          if(onEdit!=null)  
          TextButton(onPressed:onEdit, child: const Text('Edit'))
          ],
        ),

    ],

    );
  }
}