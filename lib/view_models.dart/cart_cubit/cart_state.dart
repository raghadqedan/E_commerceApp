part of 'cart_cubit.dart';


 class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartLoaded extends CartState {
    final List<CartOrdersModel> cartItems;
    final double subTotal;
  CartLoaded({required this.cartItems,required this.subTotal});
}
class CartError extends CartState {
    final String message;

  CartError({required this.message});
}

class QuantityCounterLoading extends CartState {
    final String cartOrderId;

  QuantityCounterLoading({required this.cartOrderId});
}
class QuantityCounterLoaded extends CartState {
    final int value;
    final CartOrdersModel cartOrder;

  QuantityCounterLoaded({required this.value, required this.cartOrder});

 
}
class QuantityCounterError extends CartState {
    final String message;

  QuantityCounterError({required this.message});

}













