part of 'checkout_cubit.dart';

class CheckoutState {}

class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState {}
class CheckoutLoaded extends CheckoutState {
final preferedAddressModel preferedAddress;
final PaymentMethodModel preferedPaymentMethod;
final List<CartOrdersModel> cartItems;
final double totalAmount;

   CheckoutLoaded({required this.totalAmount, required this.preferedAddress, required this.preferedPaymentMethod, required this.cartItems});
}
class CheckoutError extends CheckoutState {
    final String message ;

  CheckoutError({required this.message});
}
