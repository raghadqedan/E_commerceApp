// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
final String id;
final String name;
final String imgurl;

  CategoryModel({ required this.id, required this.name, required this.imgurl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imgurl': imgurl,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imgurl: map['imgurl'] as String,
    );
  }

 
}


List<CategoryModel> dummyCategories=[
   CategoryModel(id: 'WmXUJvMeKmydC1YVEe6o' ,name: 'New Arivals ', imgurl:'https://rukminim2.flixcart.com/image/550/650/kwmfqfk0/kids-dress/f/8/8/6-9-months-baby-girl-printed-cotton-summer-wear-frock-dresses-original-imag99hhqcevphyq.jpeg?q=90&crop=false'),
  CategoryModel(id: 'mx7oY3qeITNIV63jfF2j',name: 'Clothes', imgurl:'https://pngimg.com/uploads/hoodie/small/hoodie_PNG30.png'),
  CategoryModel(id: 'ClCHsH5xhk6R21KIqF3j',name: 'Bags', imgurl:'https://cdn.thewirecutter.com/wp-content/media/2024/02/messengerbags-2048px-07653.jpg'),
 CategoryModel(id: 'tplsRBigbbygMZMk8vBz',name: 'Shoes', imgurl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzj8zS5nIXS27xQAcP2UGjKjECMRblAjccmw&usqp=CAU'),
 CategoryModel(id: 'o74tIQ6nOE2C73QRDYpM',name: 'Electronics', imgurl:'https://static.vecteezy.com/system/resources/thumbnails/024/558/883/small/black-wireless-headphones-isolated-on-transparent-background-ai-generated-png.png'),
 CategoryModel(id: 'gXs6hikPBg9HmA3XLKdy',name: 'Beauty', imgurl:'https://beautytemple.co.uk/wp-content/uploads/2015/10/Makeup.jpg'),
 CategoryModel(id: 'Ny78VbcW64MAOoe3eehG',name: 'Sports', imgurl:'https://static.vecteezy.com/system/resources/previews/012/996/777/non_2x/sport-ball-volleyball-free-png.png'),






];

