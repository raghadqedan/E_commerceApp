// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:ecommerce_app/models/product_item_model.dart';

enum FiltterFaveroitsItem{
All,
Latest,
Most_Popular,
Cheapest;
}


class FavoritesItemModel {
  final String id;
  final ProductItemModel favProductItem;

  FavoritesItemModel({
    required this.id,
    required this.favProductItem,

 
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': favProductItem.toMap(),
    };
  }

  factory FavoritesItemModel.fromMap(Map<String, dynamic> map) {
    return FavoritesItemModel(
      id: map['id'] as String,
      favProductItem: ProductItemModel.fromMap(map['favProductItem'] as Map<String,dynamic>,map['product']['id']),
    );
  }

 
}

List<FavoritesItemModel> dummyFaveroits=[];