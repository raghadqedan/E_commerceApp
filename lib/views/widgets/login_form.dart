
import 'package:ecommerce_app/utils/Routes/AppRoutes.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/view_models.dart/auth_cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isVisiable = false;
  

  @override
  Widget build(BuildContext context) {
    final cubit=BlocProvider.of<AuthCubit>(context);
    String? validateEmail(String value) {
      String pattern =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      RegExp re = RegExp(pattern);
      bool result = re.hasMatch(value);
      if (result) {
        return null;
      } else {
        return "Please enter valid email";
      }
    }

    String? validatePassword(String value) {
      String pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp re = RegExp(pattern);
      bool result = re.hasMatch(value);
      if (result) {
        return null;
      } else {
        if (_passwordController.text.isEmpty) {
          return 'Please enter your password';
        }
        if (_passwordController.text.length < 8) {
          return 'Password Must be at least  8 charater,one uppercase character,one lowercase character,one number and one special case .';
        }
        if (!_passwordController.text.contains(RegExp(r'[a-z]'))) {
          return 'Password Must contain  at least  one lowercase  charater';
        }
        if (!(_passwordController.text.contains(RegExp(r'[A-Z]')))) {
          return 'Password Must contain  at least  one uppercase  charater';
        }
        if (!_passwordController.text.contains(RegExp(r'[0-9]'))) {
          return 'Password Must contain  at least  one number ';
        }
        if (!_passwordController.text
            .contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
          return 'Password Must contain  at least  one special Character  ';
        }
      }
    }
    Future <void> login()async {
      if (_formKey.currentState!.validate()) {
                    await cubit.signInWithEmailAndPassword(_emailController.text, _passwordController.text);
                      
                    }
    }

    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  label: const Text("Email"),
                  hintText: "Enter your email",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.grey),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 25,
                    color: AppColors.primary,
                  )),
              validator: (value) {
                return validateEmail(value!);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Password",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  label: const Text("Password"),
                  hintText: "Enter your password",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.grey),
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    size: 25,
                    color: AppColors.primary,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisiable = !_isVisiable;
                        });
                      },
                      icon: _isVisiable
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined))),
              obscureText: !_isVisiable,
              validator: ((value) {
                return validatePassword(value!);
              }),
            ),
                const SizedBox(
              height: 6,
            ),
            
            
              Align(alignment:AlignmentDirectional.centerEnd,child: InkWell(onTap:(){},child:  Text("Forgot Password ?",style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14,color: AppColors.primary),))),
                const SizedBox(
              height: 4,
            ),
           
             Align(alignment:AlignmentDirectional.centerEnd,child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Don't have an account?",style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight:FontWeight.w600,fontSize: 13),),
                InkWell(onTap: (){Navigator.of(context).pushNamed(AppRoutes.signup);},child:  Text(" Sign Up ",style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14,color: AppColors.primary),)),
              ],
            )),
              
          
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              bloc: cubit,
              listenWhen:((previous, current) => current is AuthSuccess||current is AuthFailuer) ,
              listener:(context,state){
                if(state is AuthSuccess){
 Navigator.of(context).pushNamed(AppRoutes.buttomNavbar);
                }else if(state is AuthFailuer)
                {
                  showDialog(context: context, builder: (_)=> AlertDialog(title: const Text('Alert'),content:Text(state.message.toString()),
                  actions: [IconButton(onPressed:()=> Navigator.of(context).pop(), icon: const Text('Ok'))],
                  ));
                  
                }
              }

              ,
              buildWhen:((previous, current) => current is AuthLoading ||current is AuthSuccess|| current is AuthFailuer||current is AuthInitial ),
              builder: (context, state) {
                if(state is AuthLoading){
                 return const  MainButton(
                  onPressed: null,
                  child: CircularProgressIndicator.adaptive());
                }
                else{
                return MainButton(
                  title: "Login",
                  onPressed: () async {
                    //validate method return true if all textFormField in the form which hase the _formkey return null and
                    // return false if any of thie FormTextField is empty so return string not null
                    login();
                  },
                );}
              },
            ),
          ],
        ));
  }
}
