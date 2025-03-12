import 'package:ecomerce/cubit/auth_cubit/log_in_cubit/log_in_cubit.dart';
import 'package:ecomerce/views/screens/aut_screens/widgets/log_in_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LogInCubit(),
          child: LoginScreenView(),
        ),),
    );
  }
}
