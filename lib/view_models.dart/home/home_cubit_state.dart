part of 'home_cubit.dart';


 class HomeState {}

 class HomeCubitInitial extends HomeState {}

 class HomeLoading extends HomeState{}

 class HomeLoaded extends HomeState{
 final List<ProductItemModel> products;
 final List<AnnouncementModel> anouncement;
 HomeLoaded(this.products,this.anouncement);

 }

 class HomeError extends HomeState{
 final String message;
 HomeError(this.message);
 }

 
