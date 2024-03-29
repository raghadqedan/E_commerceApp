import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class LastSearchWidget extends StatelessWidget {
  final String title;
  const LastSearchWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
      height: 40,
         
      child: InkWell(
        onTap: (){},
        child: DecoratedBox(decoration: BoxDecoration(color: AppColors.white,border: Border.all(color: AppColors.grey),borderRadius:BorderRadius.circular(12)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.close))
          ],
        ),),
      ),
      
      
      
      ),
    );

  }
}