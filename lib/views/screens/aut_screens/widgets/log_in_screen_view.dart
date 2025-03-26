import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/shared/custom_button.dart';
import 'package:ecomerce/core/shared/custom_lable_form_faild_text.dart';
import 'package:ecomerce/core/shared/local/cache_helper.dart';
import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/cubit/auth_cubit/log_in_cubit/log_in_cubit.dart';
import 'package:ecomerce/cubit/category_cubit/category_cubit.dart';
import 'package:ecomerce/views/screens/aut_screens/widgets/do_not_have_acc.dart';
import 'package:ecomerce/views/screens/aut_screens/widgets/remember_forgetpass.dart';
import 'package:ecomerce/views/screens/home_screens/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenView extends StatelessWidget {
   LoginScreenView({super.key});
  bool obscureText = true;
  final GlobalKey<FormState>  _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
  listener: (context, state) {
    if(state is LogInSucsses){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.userModel!.message!),
          duration: Duration(seconds: 10), // مدة ظهور الsnackbar
        ),
      );
      state.userModel!.status == true ?
      CacheHelper.saveDate(
          key:'token',
          value: state.userModel!.data!.token).then((value){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>
                HomeLayout()));
      }): null;
    }else if(state is LogInError){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث حطء أثناء التسجيل'),
          duration: Duration(seconds: 5), // مدة ظهور الsnackbar
        ),
      );
    }
  },
  builder: (context, state) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: Constans.getSize(context).width *.04
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetsManager.autImage),
              Center(
                child: Text(
                  StringsManager.loginAuthText,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 22),
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primaryColor,
                ),
                ),
              ),
              SizedBox(height: Constans.getSize(context).height *.01 ,),
              CustomLableFormFaildText(
                hintText: 'ex: example@example.com',
                obscureText: !obscureText,
                labelText: StringsManager.eMailText,
                controller: emailController,
                icon: Icon(Icons.email_outlined,
                  color: ColorManager.primaryColor,),
              ),
              CustomLableFormFaildText(
                hintText: 'ex: ***********************',
                labelText: StringsManager.passwordText,
                obscureText: LogInCubit.get(context).secirty,
                controller: passController,
                suffixIcon: IconButton(
                    onPressed: (){
                      LogInCubit.get(context).changePasswordVisibility();
                    },
                    icon: Icon(LogInCubit.get(context).suffix),
                ),
                icon: Icon(
                  Icons.lock_outline,
                  color: ColorManager.primaryColor,
                ),
              ),
              SizedBox(height: Constans.getSize(context).height *.02 ,),
              RememberAndForgetPass(),
              SizedBox(height: Constans.getSize(context).height *.02 ,),
         state is LogInLoading?   Center(child: CircularProgressIndicator())
             : CustomButton(
                  onPressed: (){
                    LogInCubit.get(context).
                    logIn(email: emailController.text,
                        password: passController.text
                    );


              },
                  buttonText: StringsManager.logInText),
              DoNotHaveAccWidget(),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
