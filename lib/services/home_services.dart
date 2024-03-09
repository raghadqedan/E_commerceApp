 import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';

abstract class  HomeServices{

Future<List<ProductItemModel>> getProducts();

}
class HomeServicesApiImp extends HomeServices{
  FirestoreService fireStore=FirestoreService.instance;
  @override
  Future<List<ProductItemModel>> getProducts() async =>
   await  fireStore.getCollection<ProductItemModel>(path: ApiPathes.products(), 
   builder: ((data, documentId) =>ProductItemModel.fromMap(data,documentId))
   
   );

  
  
}