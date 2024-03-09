part of 'product_details_cubit.dart';


class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}
class ProductDetailsLoading extends ProductDetailsState {}
class ProductDetailsLoaded extends ProductDetailsState {
    final ProductItemModel prodect;
    ProductDetailsLoaded({required this.prodect});
}
class ProductDetailsError extends ProductDetailsState {
    final String message;
    ProductDetailsError({required this.message});
}

class AddingToCart extends ProductDetailsState{}
class AddedToCart extends ProductDetailsState{
    final CartOrdersModel order;
    AddedToCart({required this.order});

}
class AddingToCartError extends ProductDetailsState{
    final String message;
AddingToCartError({required this.message});

}

class SizedChanged extends ProductDetailsState{
    final ProductSize size;

  SizedChanged({required this.size});

}


class QuantityChanged extends ProductDetailsState{
    final int quantity;

  QuantityChanged( this.quantity);
 
  

}







