// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_app/models/product_item_model.dart';

class CartOrdersModel {
  final String id;
  final ProductItemModel product;
  final ProductSize size;
  final int  quantity;
  final double totalPrice;
  

  CartOrdersModel({required this.id, required this.product, required this.size, required this.quantity, required this.totalPrice});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'size': size.name,
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }

  factory CartOrdersModel.fromMap(Map<String, dynamic> map) {
    return CartOrdersModel(
      id: map['id'] as String,
      product: ProductItemModel.fromMap(map['product'] as Map<String,dynamic>,map['product']['id']),
      size: ProductSize.fromString(map['size'] ),
      quantity: map['quantity'] as int,
      totalPrice: map['totalPrice'] as double,
    );
  }


  CartOrdersModel copyWith({
    String? id,
    ProductItemModel? product,
    ProductSize? size,
    int? quantity,
    double? totalPrice,
  }) {
    return CartOrdersModel(
      id: id ?? this.id,
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
