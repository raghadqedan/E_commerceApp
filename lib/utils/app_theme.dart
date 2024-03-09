import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme{
static final ThemeData  lightTheme=ThemeData(
  
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.deepPurple ),
        inputDecorationTheme: InputDecorationTheme(
          filled :true,
          fillColor: AppColors.grey2,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none
          ),
          errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),borderSide:BorderSide.none),
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),borderSide:BorderSide.none),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),borderSide:BorderSide.none),
          focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),borderSide:BorderSide.none),
        
          ),
        

          
      );

}