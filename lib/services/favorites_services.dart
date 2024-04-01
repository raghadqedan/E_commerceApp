
import 'package:ecommerce_app/models/favorite_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';

abstract class FavoritesServices{
  Future<List<FavoritesItemModel>> getFavoritesItems(String uid);
  Future<void> addFavaoritesItem(String uid, ProductItemModel product);
  Future<void> deleteFavoritesItem(String favoritesItemId,String uId);



}
class FavoritesServicesImp implements FavoritesServices{
   final firestoreService = FirestoreService.instance;

  @override
  Future<List<FavoritesItemModel>> getFavoritesItems(String uid) async =>
      await firestoreService.getCollection<FavoritesItemModel>(
        path: ApiPathes.getFavoritesItems(uid),
        builder: (data, documentId) => FavoritesItemModel.fromMap(data),
      );

  @override
  Future<void> addFavaoritesItem(String uid, ProductItemModel product) async =>
      await firestoreService.setData(
        path: ApiPathes.favoriteItem(uid, product.id),
        data: product.toMap(),
      );

      Future<void>deleteFavoritesItem(String favoritesItemId,String uId) async {
        await  firestoreService.deleteData(path: ApiPathes.favoriteItem(uId, favoritesItemId));
      }

}