// ignore_for_file: public_member_api_docs, sort_constructors_first


enum ProductSize {
  S,
  M,
  L,
  XL,
  XXL;

 static ProductSize fromString(String size) {
    if (size == ProductSize.S.name) {
      return ProductSize.S;
    } else if (size == ProductSize.M.name) {
      return ProductSize.M;
    } else if (size == ProductSize.L.name) {
      return ProductSize.L;
    } else if (size == ProductSize.XL.name) {
      return ProductSize.XL;
    } else {
      return ProductSize.XXL;
    }

}
}

class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final double price;
  final String category;
  final double averageRate;
  bool isFav;

  ProductItemModel(
      {required this.id,
      required this.name,
      required this.imgUrl,
      this.description =
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      required this.price,
      required this.category,
      this.averageRate=4.5,
      this.isFav=false,
      });


ProductItemModel copyWith({
  String? id,
  String? name,
  String? imgUrl,
  String? description,
  double? price,
  String? category,
  double? averageRate,
}) {
  return ProductItemModel(
      id: id ?? this.id,
      name: name?? this.name,
      imgUrl:imgUrl ?? this.imgUrl,
      price: price?? this.price,
      category: category?? this.category,
      averageRate: averageRate?? this.averageRate);
}

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
      'description': description,
      'price': price,
      'category': category,
      'averageRate': averageRate,
    };
  }

  factory ProductItemModel.fromMap(Map<String, dynamic> map,String documentId) {
    return ProductItemModel(
     id:documentId ,
     name: map['name'] ??'',
    imgUrl:map['imgUrl'] ??'',
     description: map['description'] ??'',
     price: map['price']!.toDouble()??0.0,
     category: map['category'] ??'',
     averageRate: map['averageRate']!.toDouble()?? 0.0,

    );
  }
}

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: 'hn12xZVWZ5NKIJiiu94D',
    name: 'T-shirt',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    price: 10,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: 'wYT96IptjcFbwfLWcke5',
    name: 'Black Shoes',
    imgUrl: 'https://pngimg.com/d/men_shoes_PNG7475.png',
    price: 20,
    category: 'Shoes',
  ),
  ProductItemModel(
    id: '7DIbatayxU03Qw2DMQ4K',
    name: 'Trousers',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2016/09/Trouser-Free-Download-PNG.png',
    price: 30,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: '2D2xSMhHsossEhYfeQyj',
    name: 'Pack of Tomatoes',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/12/tomatopng.parspng.com-6.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: 'YqgDcygPgP0Cf08nyBSz',
    name: 'Pack of Potatoes',
    imgUrl: 'https://pngimg.com/d/potato_png2398.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: 'CL3wGmhdOX9QpFgBx9W8',
    name: 'Pack of Onions',
    imgUrl: 'https://pngimg.com/d/onion_PNG99213.png',
    price: 10,
    category: 'Groceries',
  ),
  ProductItemModel(
    id: 'DvemBla1yOhQpmECuxLC',
    name: 'Pack of Apples',
    imgUrl: 'https://pngfre.com/wp-content/uploads/apple-43-1024x1015.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: 'MA0to7cAhYkcQVBWhmgc',
    name: 'Pack of Oranges',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/05/orangepng.parspng.com_-1.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: 'yvZyto9TfVVbgMVpG4nK',
    name: 'Pack of Bananas',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/015/100/096/original/bananas-transparent-background-free-png.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '9gau6FHygugw4X7Ldp1C',
    name: 'Pack of Mangoes',
    imgUrl: 'https://purepng.com/public/uploads/large/mango-tgy.png',
    price: 10,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: 'WcAFS7rff3v4Fec35YEH',
    name: 'Sweet Shirt',
    imgUrl:
        'https://www.usherbrand.com/cdn/shop/products/5uYjJeWpde9urtZyWKwFK4GHS6S3thwKRuYaMRph7bBDyqSZwZ_87x1mq24b2e7_1800x1800.png',
    price: 15,
    category: 'Clothes',
  ),
];