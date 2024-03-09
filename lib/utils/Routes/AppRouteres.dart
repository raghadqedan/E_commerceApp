import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/Routes/AppRoutes.dart';
import 'package:ecommerce_app/view_models.dart/checkout_cubit/checkout_cubit.dart';
import 'package:ecommerce_app/view_models.dart/product_details/product_details_cubit.dart';
import 'package:ecommerce_app/views/pages/Custom_bottom_navbar.dart.dart';
import 'package:ecommerce_app/views/pages/checkout_page.dart';
import 'package:ecommerce_app/views/pages/login_page.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:ecommerce_app/views/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouters {
  static Route<dynamic>? OnGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final productItem = settings.arguments as ProductItemModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ProductDetailsCubit>(
                  create: (context) {
                    final cubit = ProductDetailsCubit();
                    cubit.getProductDetails(productItem.id);
                    return cubit;
                  },
                  child: ProductDetailsPage(),
                ));
      case AppRoutes.buttomNavbar:
        return MaterialPageRoute(builder: (_) => const CustomButtomNavBar());
      case AppRoutes.homeLogin:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.checkout:
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider<CheckoutCubit>(
                  create: (context) { final cubit=CheckoutCubit();
                  cubit.getCheckoutPage();
                  return cubit;},
                  child: const CheckoutPage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Error Page ')),
                ));
    }
  }
}
