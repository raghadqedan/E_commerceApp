import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/payment_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';

abstract class CheckoutServices {
  Future<List<preferedAddressModel>> getAddresses(String uid,
      {bool fetchPreferred = false});
  Future<List<CartOrdersModel>> getCartItems(String uid);
  Future<List<PaymentMethodModel>> getPaymentMethod(String uid, {bool fetchPreferred = false});
}

class CheckoutServicesImp implements CheckoutServices {
  final fireStoreServices = FirestoreService.instance;
  @override
  Future<List<preferedAddressModel>> getAddresses(String uid,
      {bool fetchPreferred = false}) async {

    return await fireStoreServices.getCollection<preferedAddressModel>(
        path: ApiPathes.getAddresses(uid),
        builder: ((data, documentID) => preferedAddressModel.fromMap(data)),
        queryBuilder: fetchPreferred
            ? (query) => query.where('isFavorites', isEqualTo: true)
            : null);
  }

  @override
  Future<List<CartOrdersModel>> getCartItems(String uid) async {
    return await fireStoreServices.getCollection<CartOrdersModel>(
        path: ApiPathes.getcartItems(uid),
        builder: ((data, documentId) => CartOrdersModel.fromMap(data)));
  }

  @override
  Future<List<PaymentMethodModel>> getPaymentMethod(String uid,
      {bool fetchPreferred = false}) async {
        
       final s= await fireStoreServices.getCollection<PaymentMethodModel>(
        path: ApiPathes.getPaymentMethods(uid),
        builder: ((data, documentID) => PaymentMethodModel.fromMap(data)),
         queryBuilder: fetchPreferred
             ? (query) => query.where('isFavorites', isEqualTo: true)
             : null
        );
            print(s);
            return s;
     

  
  }
}
