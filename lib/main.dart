import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/utils/Routes/AppRouteres.dart';
import 'package:ecommerce_app/utils/Routes/AppRoutes.dart';
import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:ecommerce_app/view_models.dart/auth_cubit/auth_cubit_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  //to ensure that the  Firebase.initializeApp is initalized successfully.
  WidgetsFlutterBinding.ensureInitialized();
  //to  initialize myfirebase project before run my app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) {
        final cubit = AuthCubit();
        cubit.getCurrentUser();
        return cubit;
      },
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<AuthCubit>(context);
        cubit.getCurrentUser;
        return BlocBuilder<AuthCubit, AuthState>(
          bloc: cubit,
          buildWhen: ((previous, current) =>
              current is AuthSuccess || current is AuthInitial),
          builder: (context, state) {
            return MaterialApp(
            
              title: 'Ecommerce_app',
              theme: AppTheme.lightTheme,
              //  home:CustomButtomNavBar()
              initialRoute: (state is AuthSuccess)
                  ? AppRoutes.buttomNavbar
                  : AppRoutes.homeLogin,
              onGenerateRoute: AppRouters.OnGenerateRoute,
            );
          },
        );
      }),
    );
  }
}
