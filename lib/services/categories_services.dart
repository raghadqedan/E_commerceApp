
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';

abstract class  CategoriesServices{

Future<List<CategoryModel>> getCategories();



}
class CategoriesServicesApiImp extends CategoriesServices{

  FirestoreService fireStore=FirestoreService.instance;
  @override
  Future<List<CategoryModel>> getCategories() async {
      print('wwww');
  return  await  fireStore.getCollection<CategoryModel>(path: ApiPathes.categories(), 
   builder: ((data, documentId) =>CategoryModel.fromMap(data))
   );
  }
  
}
