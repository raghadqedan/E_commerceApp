import 'package:ecommerce_app/models/added_to_cart.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final dynamic cubit;
  final int? counter;
  final CartOrdersModel? cartOrder;
  bool isLoading;

 CounterWidget({super.key, this.cubit, this.counter, this.cartOrder,this.isLoading=false});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
         // border: Border.all(color:AppColors.grey,width: 2.0),
            borderRadius: BorderRadius.circular(30), color: AppColors.grey2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child :Row(
            children: [
              CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    onPressed: () async {
                        cartOrder != null
                ? await cubit.decrementCounter(cartOrder)
                : await cubit.decrementCounter();
                    },
                    icon: const Icon(
                      size: 20,
                      Icons.remove,
                      color: AppColors.black,
                    ),
                  )),
            
               isLoading? const Center(child:  SizedBox(
                height: 20,width: 18,
                child: CircularProgressIndicator.adaptive())): Text(
                   counter.toString(),
                     style: Theme.of(context).textTheme.titleMedium,
                  )
          ,
              CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    onPressed: () 
                    async => cartOrder != null
                ? await cubit.incrementCounter(cartOrder)
                : await cubit.incrementCounter(),
                    
                    icon: const Icon(
                      size: 18,
                      Icons.add,
                      color: AppColors.black,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
