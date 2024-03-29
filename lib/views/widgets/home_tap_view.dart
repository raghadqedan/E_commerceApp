
import 'package:ecommerce_app/utils/Routes/AppRoutes.dart';
import 'package:ecommerce_app/view_models.dart/home/home_cubit.dart';
import 'package:ecommerce_app/views/widgets/custom_carousel_indicatior.dart';
import 'package:ecommerce_app/views/widgets/prodect_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTapView extends StatefulWidget {
  const HomeTapView({super.key});

  @override
  State<HomeTapView> createState() => _HomeTapViewState();
}

class _HomeTapViewState extends State<HomeTapView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getHomeData();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is HomeLoaded ||current is HomeLoading||current is HomeError,
        
        builder: (context, state) {
if(state is HomeLoading){
return  const Center(child: CircularProgressIndicator.adaptive(),);}
else if(state is HomeError){
return Center(child: Text(state.message),);}
          else  if(state is HomeLoaded){
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                     CustomCarouselIndicatior(anouncement:state.anouncement),
                    const SizedBox(height: 16.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Arrifals',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text('See All')),
                        ]),
                    const SizedBox(
                      height: 16,
                    ),
                    GridView.builder(
                      itemCount: state.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(AppRoutes.productDetails,
                                      arguments: state.products[index]).then((value) => setState((){})),
                          child: ProductItem(
                            productItem: state.products[index],
                          ),
                        );
                      },
                    ),
                  ]),
            ),
          );}
  else{
          return const  SizedBox();
        }
        },
       
      ),
    );
  }
}
