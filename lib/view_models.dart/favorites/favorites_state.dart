part of 'favorites_cubit.dart';

class FavoritesState {}

 class FavoritesInitial extends FavoritesState {}
 class FavoritesLoading extends FavoritesState {}

 class FavoritesLoaded extends FavoritesState {
    final List<ProductItemModel> favorites;

  FavoritesLoaded(this.favorites);
 }

 class FavoritesError extends FavoritesState {
final String message;

  FavoritesError(this.message);

 }


