import 'package:ecommerce_app/models/UserModel.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
      final AuthServices authServices = AuthServicesImp();
  UserCubit() : super(UserInitial());

  

Future<void> getProfileData()async{
    emit(UserLoading());
    try{
    final user= await authServices.currentUser();
        emit(UserLoaded(user!));
    
    }catch(e){
        emit(UserError(e.toString()));




    }}
}
