import 'package:ecommerce_app/models/favorite_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());


void getFavoritesDate()async {
    emit(FavoritesLoading());
    try{
         Future.delayed(const Duration(seconds: 2));
        final favorites=dummyFaveroits;
        emit(FavoritesLoaded(favorites));




    }catch(e){emit(FavoritesError(e.toString()));}
}



}
