import 'package:ecomerce/cubit/auth_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecomerce/views/screens/aut_screens/widgets/signup_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: SignupScreenView(),
      ),
    );
  }
}
