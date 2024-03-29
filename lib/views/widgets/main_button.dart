import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
final  Widget? child;
  final String? title;
  final double height;
  final VoidCallback? onPressed;
  final Color fgColor;
  final Color bgColor;

  const MainButton({super.key, this.title, this.onPressed, this.fgColor=AppColors.white,  this.bgColor=AppColors.primary, this.child,  this.height=50}):assert(child!=null||title!=null);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(foregroundColor: fgColor,backgroundColor: bgColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: child??Text(title!),),
    );
  }
}