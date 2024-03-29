
import 'package:ecommerce_app/utils/Routes/AppRoutes.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/view_models.dart/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/views/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:ecommerce_app/views/widgets/subTotalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    // final order=CartOrdersModel(
    //   id: DateTime.now().toIso8601String(),
    //   product: dummyProducts[3],
    //   size: ProductSize.S,
    //   quantity: 3,
    //   totalPrice:  dummyProducts[3].price * 3,
    // );

    return BlocConsumer<CartCubit, CartState>(
      bloc:BlocProvider.of<CartCubit>(context) ,
    listenWhen: (previous, current) => current is CartError,
      listener: (context, state) {
        if(state is CartError){
           const Center(child: Text('Error Page '),);
        }
    
        
      },
      buildWhen: (previous, current) => current is CartInitial||current is CartLoading ||current is CartLoaded,
      builder: (context, state) {
        if(state is CartLoading){
          return const  Center(child:  CircularProgressIndicator.adaptive());
        }else if(state is CartLoaded){
          final cartItems=state.cartItems;
          final subTotal=state.subTotal;
        return Padding(
          padding:const  EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: cartItems.isNotEmpty? RefreshIndicator(
            onRefresh: ()async=>BlocProvider.of<CartCubit>(context).getCartItems(),
            child: ListView(
              children:[ ListView.builder(
                 physics: const NeverScrollableScrollPhysics(),
                
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: ((context, index) => CartItemWidget(cartItem: cartItems[index])),
              ),
              Container(
               
                decoration: const BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(20),)),
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  
                  Container( width: size.width-120,
              height: 5,
                    decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(20)),),
              
                  SubTotalWidget(title: 'SubTotal',amount:subTotal,),
                               const  SizedBox(height: 15,),
                const  SubTotalWidget(title: 'Shipping',amount:6),
                               const  SizedBox(height: 25,),
                 Dash(
                length: size.width -80,
                dashLength: 12,
                dashColor: AppColors.grey,
              ),
                SubTotalWidget(title: 'Totalamount',amount:subTotal+6),
                               const  SizedBox(height: 15,),
                               MainButton(title: 'CheckOut',onPressed: ()=>Navigator.of(context,rootNavigator: true).pushNamed( AppRoutes.checkout),)
                ],),
              ),
              ),
              
           ] ),
          ):const Center(child: Text('No Order In Cart '),)
        );}
         else if (state is CartError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox.shrink();
        }

        }
      ,
    );
  }
}
