
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/views/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              Text("Create Account",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 8,
              ),
              Text("Please create your account",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.grey)),
              const SizedBox(
                height: 40,
              ),
              const SignupForm(),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: AlignmentDirectional.center,
                  child: Text("Or using other method",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.grey))),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset('assets/google.png',
                        width: 25, height: 25, fit: BoxFit.contain),
                    label: const Text(
                      'Sign in with Google',
                      style: TextStyle(color: AppColors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: AppColors.white),
                  )),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: AppColors.blue,
                      size: 28,
                    ),
                    label: const Text(
                      'Sign in with Facebook',
                      style: TextStyle(color: AppColors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: AppColors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
