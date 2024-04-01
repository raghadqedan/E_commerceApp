import 'package:ecommerce_app/models/favorite_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/favorites_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
    final favoritesService=FavoritesServicesImp();
    final authUser=AuthServicesImp();
  FavoritesCubit() : super(FavoritesInitial());


void getFavoritesDate()async {
    emit(FavoritesLoading());
    try{
       final User? user= await authUser.currentUser();
  final favorites=await favoritesService.getFavoritesItems(user!.uid) ;
   emit(FavoritesLoaded(favorites));

    }catch(e){emit(FavoritesError(e.toString()));}
}

void addToFavorites(ProductItemModel product)async {
    emit(FavoritesLoading());
    try{
       final User? user= await authUser.currentUser();
   await favoritesService.addFavaoritesItem(user!.uid,product) ;
   emit(Favoritessuccess());

    }catch(e){emit(FavoritesError(e.toString()));}
}

Future<void> removeFromFavorites(String favoritesItemId)async{
      emit(FavoritesLoading());
    try{
      
    final  user=await authUser.currentUser();
     await  favoritesService.deleteFavoritesItem( favoritesItemId ,user!.uid);

    }catch(e){emit(FavoritesError(e.toString()));}
}



}