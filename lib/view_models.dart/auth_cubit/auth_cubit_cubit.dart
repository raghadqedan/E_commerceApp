import 'package:ecommerce_app/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthServices authServices = AuthServicesImp();
  AuthCubit() : super(AuthInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      if (await authServices.signInWithEmailAndPassword(email, password)) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailuer("Failer to sign in "));
      }
    } catch (e) {
      emit(AuthFailuer(e.toString()));
    }
  }


Future<void> getCurrentUser()async{
    emit(AuthLoading());
    try{
    final user= await authServices.currentUser();
    if(user !=null){
        emit(AuthSuccess());
    }else{
    emit(AuthInitial());
    }
    }catch(e){
        emit(AuthFailuer(e.toString()));




    }}

    Future<void> signOut() async{
       emit(AuthLoading());

       try{
        Future.delayed(const Duration(seconds: 2));
       await authServices.logOut();
       emit(AuthInitial());
  


       }catch(e){
        emit(AuthFailuer(e.toString()));
        
       }
    }


   Future<void> signUpWithEmailAndPassword(String name,String email,String password)async {
    emit(AuthLoading());
    try{
if(await authServices.signUpWithEmailAndPassword(name,email, password)){
    emit(AuthSuccess());
}else{
    emit(AuthFailuer('Failed Signup'));
}      

    }catch(e){
        emit(AuthFailuer(e.toString()));
    }

 }





} 








