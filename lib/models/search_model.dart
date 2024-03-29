import 'package:ecommerce_app/models/product_item_model.dart';

class SearchItemModel{
  final ProductItemModel product;
  final String state;
  final double  numberOfSearch;

  SearchItemModel({required this.product, required this.state, required this.numberOfSearch});





}

List<SearchItemModel> dummyPopularSearch=[SearchItemModel(product:dummyProducts[0] ,state: 'HOT',numberOfSearch:1.6),
SearchItemModel(product:dummyProducts[3] ,state: 'HOT',numberOfSearch:1.6),
SearchItemModel(product:dummyProducts[1] ,state: 'New',numberOfSearch:1.3),
SearchItemModel(product:dummyProducts[2] ,state: 'Popular',numberOfSearch:1.1),
SearchItemModel(product:dummyProducts[4] ,state: 'Popular',numberOfSearch:1.9),
SearchItemModel(product:dummyProducts[5] ,state: 'Hot',numberOfSearch:1.1)
];
List<String>lastSearch=['Electronics','Paint','Three second','Long shirt',];