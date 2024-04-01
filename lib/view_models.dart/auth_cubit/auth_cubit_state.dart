part of 'auth_cubit_cubit.dart';

 class AuthState {}

 class AuthInitial extends AuthState {}
  class AuthLoading extends AuthState {}
   class AuthSuccess extends AuthState {
    
    
   }
   class AuthFailuer extends AuthState {
    final String message;

  AuthFailuer(this.message);
   }

