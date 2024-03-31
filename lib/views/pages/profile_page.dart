import 'package:ecommerce_app/utils/Routes/AppRoutes.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/view_models.dart/auth_cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:ecommerce_app/views/widgets/profile_item.dart';
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

return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.person,
                  size: 60,
                )),
            const SizedBox(
              width: 40,
            ),
            Column(
              children: [
                Text("Raghad qedan ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
                Text("ID:204 222 881",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey,
                        ))
              ],
            ),
            const SizedBox(
              width: 45,
            ),
            TextButton(onPressed: () {}, child: const Text("Edit Profile")),
          ],
        ),
        const SizedBox(height: 30),
         Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
       const  ProfileItem(name: 'My Profile'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const ProfileItem(name: 'Payment Methods'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
       const  ProfileItem(name: 'Setting'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const ProfileItem(name: 'Help'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const ProfileItem(name: 'PrivacyPolicy'),
        Divider(
          height: 12,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 60),
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () async{
                await  cubit.signOut();
              },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Text("Log Out"),
          ),
        ),
      ]),
    );
  }
        }
    );
  }
}






          ///
        // return Center(
        //   child:MainButton (
        //       onPressed: () async{
        //        await  cubit.signOut();
        //       },
        //       child: const Text('Log out')),
        // );}
