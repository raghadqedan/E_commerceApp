import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/payment_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/checkout_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  final authServices = AuthServicesImp();
    final checkoutServices=CheckoutServicesImp();    

  Future<void> getCheckoutPage() async {
    
    emit(CheckoutLoading());
    try {
       
final authService=AuthServicesImp();
final user=await authService.currentUser();
final preferedAddressModel preferedAddress=(await checkoutServices.getAddresses(user!.uid,fetchPreferred: true)).first;
final cartItems=await checkoutServices.getCartItems(user.uid);
final preferedPaymentMethod=(await checkoutServices.getPaymentMethod(user.uid,fetchPreferred: true)).first;
final double totalAmount=cartItems.fold(0.0,(sum,item)=>sum=sum+item.quantity*item.product.price);


emit(CheckoutLoaded(preferedAddress: preferedAddress, preferedPaymentMethod: preferedPaymentMethod, cartItems: cartItems,totalAmount:totalAmount));
    } catch (e) {
      emit(CheckoutError(message: e.toString()));
    }
  }
}
