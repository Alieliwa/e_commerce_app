import 'package:ecomerce/views/screens/aut_screens/widgets/log_in_screen_view.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LoginScreenView(),),
    );
  }
}
