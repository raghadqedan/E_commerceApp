import 'package:ecommerce_app/services/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';


part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeCubitInitial());
  final HomeServicesApiImp homeService=HomeServicesApiImp();

  void getHomeData()async {
     emit(HomeLoading());
     try{
final products=await homeService.getProducts();
final announcement=await homeService.getAnnouncements();
emit(HomeLoaded(products, announcement));
    }
     catch(e){
emit(HomeError(e.toString()));

     }



  }







}
