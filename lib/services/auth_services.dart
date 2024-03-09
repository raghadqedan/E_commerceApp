import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_pathes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class AuthServices{
Future<bool>signInWithEmailAndPassword(String email,String password);
Future<void>logOut();
Future<bool>signUpWithEmailAndPassword(String name,String email,String password);
Future<User?>currentUser();
}
class AuthServicesImp extends AuthServices{
  final firebaseAuth=FirebaseAuth.instance;
  final fireStore=FirestoreService.instance;
  @override
  Future<void> logOut() async{
     await firebaseAuth.signOut();
    debugPrint('ggg');
  }
   

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {

    UserCredential userCrdential=await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    if(userCrdential.user !=null){
       return  true;
    }else{return false ;}

  }

  @override
  Future<bool> signUpWithEmailAndPassword(String name,String email, String password) async {
 UserCredential? userCrdential=await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
     final User? user = userCrdential.user;
    if (user != null) {
      fireStore.setData(path: ApiPathes.user(user!.uid), data: {
        'uid': user.uid,
        'email': email,
        'photoUrl': user.photoURL,
        'name': name,
        'phone': user.phoneNumber,
      });
      return true;
    } else {
      return false;
    }
  }


  Future<User?>currentUser(){
      return  Future.value(firebaseAuth.currentUser);

  }

}
