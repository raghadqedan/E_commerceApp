import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';

abstract class CartServices{
  Future<List<CartOrdersModel>> getCartItems(String uid);
  Future<void> updateCartItem(String uid, CartOrdersModel cartOrder);


}
class CartServicesImp implements CartServices{
   final firestoreService = FirestoreService.instance;

  @override
  Future<List<CartOrdersModel>> getCartItems(String uid) async =>
      await firestoreService.getCollection<CartOrdersModel>(
        path: ApiPathes.getcartItems(uid),
        builder: (data, documentId) => CartOrdersModel.fromMap(data),
      );

  @override
  Future<void> updateCartItem(String uid, CartOrdersModel cartOrder) async =>
      await firestoreService.setData(
        path: ApiPathes.cartItem(uid, cartOrder.id),
        data: cartOrder.toMap(),
      );

      Future<void>deleteCartItem(String cartItemId,String uId) async {
        await  firestoreService.deleteData(path: ApiPathes.cartItem(uId, cartItemId));
      }

}