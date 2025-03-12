import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/shared/custom_button.dart';
import 'package:ecomerce/core/shared/custom_lable_form_faild_text.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/cubit/auth_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreenView extends StatelessWidget {
   SignupScreenView({super.key});
  bool obscureText = true;
   final GlobalKey<FormState>  _formKey = GlobalKey();
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
    listener: (context, state) {
      if(state is SignUpSucsses){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message!),
            duration: Duration(seconds: 5), // مدة ظهور الsnackbar
          ),
        );
        state.status == true ? Navigator.pop(context) : null;
      }else if(state is SignUpError){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث حطء أثناء التسجيل'),
            duration: Duration(seconds: 10), // مدة ظهور الsnackbar
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
            key:_formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(height: Constans.getSize(context).height *.05,),
                SvgPicture.asset(AssetsManager.autImage),
                Center(
                  child: Text(
                    StringsManager.signUpAuthText,
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 22),
                      fontWeight: FontWeight.w700,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: Constans.getSize(context).height *.01 ,),
                CustomLableFormFaildText(
                  hintText: 'ex: Ahmed Ali',
                  controller: nameController,
                  obscureText: !obscureText,
                  labelText: StringsManager.nameText,
                  icon: Icon(Icons.person,
                    color: ColorManager.grayColor,),
                ),
                CustomLableFormFaildText(
                  hintText: 'ex: example@example.com',
                  labelText: StringsManager.eMailText,
                  controller: emailController,
                  obscureText: !obscureText,
                  icon: Icon(Icons.email_outlined,
                    color: ColorManager.primaryColor,),
                ),
                CustomLableFormFaildText(
                  hintText: 'ex: 01234567891',
                  controller: phoneController,
                  labelText: StringsManager.phoneText,
                  obscureText: !obscureText,
                  icon: Icon(Icons.phone,
                    color: ColorManager.primaryColor,),
                ),
                CustomLableFormFaildText(
                  hintText: 'ex: ***********************',
                  labelText: StringsManager.passwordText,
                  controller: passController,
                  obscureText: obscureText,
                  suffixIcon:Icon(Icons.visibility_off,
                    color: ColorManager.primaryColor,) ,
                  icon: Icon(Icons.lock_outline,
                    color: ColorManager.primaryColor,),
                ),
                SizedBox(height: Constans.getSize(context).height *.02 ,),
              state is SignUpLoading ?
                Center(child: CircularProgressIndicator(),)  :
              CustomButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        SignUpCubit.get(context).SignUp(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passController.text,
                        );
                      }
                    },
                    buttonText: StringsManager.signUpText),
                SizedBox(height: Constans.getSize(context).height *.02 ,),
              ],
            ),
          ),
        ),
      );
    },
    );
  }
}
