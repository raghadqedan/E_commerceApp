import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/product_details_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductSize? size;
  int quantity = 1;
  ProductDetailsCubit() : super(ProductDetailsInitial());
  final productDetailsServices=ProductDetailsServicesImp();
  final authservice=AuthServicesImp();

  Future<void> getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(ProductDetailsLoaded(
          prodect:await productDetailsServices.getProduct(productId)
            ));
    } catch (e) {
      emit(ProductDetailsError(message: e.toString()));
    }
  }
 void changeSize(ProductSize s) {
    size=s;
    emit(SizedChanged(size: s));
  }

  Future<void> addToCart(String productId)  async{
    emit(AddingToCart());
    try{
    final product =
       await productDetailsServices.getProduct(productId);
    CartOrdersModel order = CartOrdersModel(
      id: DateTime.now().toIso8601String(),
      product: product,
      size: size!,
      quantity: quantity,
      totalPrice: product.price * quantity,
    );
     emit(AddedToCart(order: order));
     final user=await authservice.currentUser();
  productDetailsServices.addToCart(order, user!.uid);
  
     
    } catch (e) {
      emit(AddingToCartError(message: e.toString()));
    }
  }

 
  void incrementCounter() {
    ++quantity;
    emit(QuantityChanged(quantity));
  }

  void decrementCounter() {
    if (quantity > 1) {
      --quantity;
    }
    emit(QuantityChanged(quantity));
  }
}
