 import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';

abstract class  HomeServices{

Future<List<ProductItemModel>> getProducts();
Future<List<AnnouncementModel>> getAnnouncements();


}
class HomeServicesApiImp extends HomeServices{
  FirestoreService fireStore=FirestoreService.instance;
  @override
  Future<List<ProductItemModel>> getProducts() async =>
   await  fireStore.getCollection<ProductItemModel>(path: ApiPathes.products(), 
   builder: ((data, documentId) =>ProductItemModel.fromMap(data,documentId))
   
   );
     @override
  Future<List<AnnouncementModel>> getAnnouncements() async =>
   await  fireStore.getCollection<AnnouncementModel>(path: ApiPathes.announcements(), 
   builder: ((data, documentId) =>AnnouncementModel.fromMap(data))
   
   );


  
  
}