
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/view_models.dart/checkout_cubit/checkout_cubit.dart';
import 'package:ecommerce_app/views/widgets/checkout_cart_item_widget.dart';
import 'package:ecommerce_app/views/widgets/checkout_title_widget.dart';
import 'package:ecommerce_app/views/widgets/location_item_widget.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:ecommerce_app/views/widgets/payment_method_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=BlocProvider.of<CheckoutCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
          centerTitle: true,
        ),
        body:  Builder(
          builder: (context) {
            return BlocBuilder<CheckoutCubit, CheckoutState>(
              bloc: cubit,
              buildWhen: (previous, current) => current is CheckoutLoading ||current is CheckoutLoaded||current is CheckoutError||current is CheckoutInitial,
              builder: (context, state) {
                if(state is CheckoutLoading){
            
                  return const Center(child: CircularProgressIndicator.adaptive());
                }else if(state is CheckoutLoaded){
                  final cartItems=state.cartItems;
                  final   preferedAddress =state.preferedAddress;
                  final preferedpaymentMethod=state.preferedPaymentMethod;
                  final totalAmount=state.totalAmount;
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckoutTitleWidget(title:'Address',onEdit: (){},),
                        LocationItemWidget(location: preferedAddress),
                       const  SizedBox(height: 16,),
                        CheckoutTitleWidget(title:'Products',numperOfProduct: cartItems.length,),
                          const  SizedBox(height: 16,),
                      ListView.builder(
                        itemCount: cartItems.length,
                        shrinkWrap: true,
                        physics:const  NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) => CheckoutCartItemWidget(cartItem:cartItems[index] ))),
                            const  SizedBox(height: 16,),
                        const CheckoutTitleWidget(title:'Payment Methods'),
                        const  SizedBox(height: 8,),
                        PaymentMethodItemWidget(paymentMethod: preferedpaymentMethod,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Totale Amount',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.grey)),
                            Text('\$$totalAmount',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight:FontWeight.w600 ,color: AppColors.primary)),
        
                        ],),
                           const  SizedBox(height: 20,), 
                           MainButton(title:'Checkout Now',onPressed: (){},)  ,
                              const  SizedBox(height: 8,),    
                        ],)       
                                  
                      
                    ),
                
                ));
               }
               else if(state is CheckoutError){
               return   Center(child: Text('Error Page ${state.message} '),);
               } 
               else{
                return const SizedBox.shrink();
               }},
            );
          }
        ));
  }
}
