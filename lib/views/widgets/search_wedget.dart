import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class SearchWedget extends StatelessWidget {
  final String title;
  final double height;
  final double width;

  bool fillter;
   SearchWedget({super.key, required this.title, this.height=60,this.width=double.infinity,this.fillter=false});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              height:height,
              width: width,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon:const  Icon(Icons.search_outlined,size: 27,),
                    
                    suffixIcon: fillter?const Icon(Icons.filter_list,size: 27,):const SizedBox(),
                    hintText: title,
                    fillColor: AppColors.white,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
              ),
            );
  }
}