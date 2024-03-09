import 'package:ecommerce_app/utils/Routes/AppRoutes.dart';
import 'package:ecommerce_app/view_models.dart/auth_cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: cubit,
      listenWhen: ((previous, current) => current is AuthFailuer ||current is AuthInitial),
      listener: (context, state) {
        if(state  is AuthFailuer){
         ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
        }else if(state is AuthInitial){
          Navigator.of(context,rootNavigator: true).pushReplacementNamed(AppRoutes.homeLogin);
        }

      },
      buildWhen: (previous, current) => current is AuthLoading||current is AuthInitial,
      builder: (context, state) {
        if(state is AuthLoading){
return const Center(
          child: MainButton(
              onPressed:null,
              child:  CircularProgressIndicator.adaptive() ,
        ));

        }
        else {
        return Center(
          child:MainButton (
              onPressed: () async{
               await  cubit.signOut();
              },
              child: const Text('Log out')),
        );}
      },
    );
  }
}
