import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
final  cartServices=CartServicesImp();
final  authServices=AuthServicesImp();
 int quantity = 1;


Future<void> getCartItems()async {
    emit(CartLoading());
    try{
        final user=await authServices.currentUser();
       final cartItems= await  cartServices.getCartItems(user!.uid);
        // final subTotal = cartItems.fold<double>(
        //   0, (sum, item) => sum + (item.product.price * item.quantity));
        final subTotal = cartItems.fold<double>(
          0, (sum, item) { 
            double result=sum + (item.product.price * item.quantity);
            return   result;});
    
       emit(CartLoaded(cartItems: cartItems,subTotal:subTotal));
    }catch(e){
        emit(CartError(message:e.toString()));
    }}

 Future<void> incrementCounter(CartOrdersModel cartOrder) async {
    emit(QuantityCounterLoading(cartOrderId: cartOrder.id));
    try {
      cartOrder = cartOrder.copyWith(quantity: cartOrder.quantity + 1,totalPrice: (cartOrder.quantity+1)*cartOrder.product.price);
      final currentUser = await authServices.currentUser();
      await cartServices.updateCartItem(
        currentUser!.uid,
        cartOrder,
      );
      emit(
        QuantityCounterLoaded(
          value: cartOrder.quantity,
          cartOrder: cartOrder,
        ),
      );
    } catch (e) {
      emit(QuantityCounterError(message: e.toString()));
    }
  }

  Future<void> decrementCounter(CartOrdersModel cartOrder) async {
      if(cartOrder.quantity>1){
    emit(QuantityCounterLoading(cartOrderId: cartOrder.id));
    try {
      
      cartOrder = cartOrder.copyWith(quantity: cartOrder.quantity - 1,totalPrice: (cartOrder.quantity-1)*cartOrder.product.price);
      final currentUser = await authServices.currentUser();
      await cartServices.updateCartItem(
        currentUser!.uid,
        cartOrder,
      );
      emit(
        QuantityCounterLoaded(
          value: cartOrder.quantity,
          cartOrder: cartOrder,
        ),
      );
    } catch (e) {
      emit(QuantityCounterError(message: e.toString()));
    }}
  }


Future<void> removeFromCart(String cartItemId)async{
    final  user=await authServices.currentUser();
   await  cartServices.deleteCartItem(cartItemId, user!.uid);

}






}