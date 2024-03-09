import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';

abstract class ProductDetailsServices{
Future<ProductItemModel> getProduct(String productId);
Future<void> addToCart(CartOrdersModel cartOrder,String userId);


}
class ProductDetailsServicesImp implements ProductDetailsServices{
  final firestore=FirestoreService.instance;
  @override
  Future<void> addToCart(CartOrdersModel cartOrder, String userId) async {
   await firestore.setData(path: ApiPathes.cartItem(userId, cartOrder.id), data: cartOrder.toMap());
  }

  @override
  Future<ProductItemModel> getProduct(String productId) async{
 return  await  firestore.getDocument(path: ApiPathes.product(productId), builder: ((data, documentID) =>
   ProductItemModel.fromMap(data,documentID)));
  }


}