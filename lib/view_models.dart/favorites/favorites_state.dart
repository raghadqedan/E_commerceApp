part of 'favorites_cubit.dart';

class FavoritesState {}

 class FavoritesInitial extends FavoritesState {}
 class FavoritesLoading extends FavoritesState {}

 class FavoritesLoaded extends FavoritesState {
    final List<FavoritesItemModel> favorites;

  FavoritesLoaded(this.favorites);
 }
  class Favoritessuccess extends FavoritesState {}

 class FavoritesError extends FavoritesState {
final String message;

  FavoritesError(this.message);

 }


