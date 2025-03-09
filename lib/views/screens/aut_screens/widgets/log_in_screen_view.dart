import 'package:ecomerce/core/constans.dart';
import 'package:ecomerce/core/shared/custom_button.dart';
import 'package:ecomerce/core/shared/custom_lable_form_faild_text.dart';
import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/utils/assets_manager.dart';
import 'package:ecomerce/core/utils/color_manager.dart';
import 'package:ecomerce/core/utils/responsive_text.dart';
import 'package:ecomerce/core/utils/strings_manager.dart';
import 'package:ecomerce/views/screens/aut_screens/widgets/do_not_have_acc.dart';
import 'package:ecomerce/views/screens/aut_screens/widgets/remember_forgetpass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenView extends StatelessWidget {
   LoginScreenView({super.key});
  bool obscureText = true;
  final GlobalKey<FormState>  _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                icon: Icon(Icons.email_outlined,
                  color: ColorManager.primaryColor,),
              ),
              CustomLableFormFaildText(
                hintText: 'ex: ***********************',
                labelText: StringsManager.passwordText,
                obscureText: obscureText,
                suffixIcon:Icon(Icons.visibility_off,
                  color: ColorManager.primaryColor,) ,
                icon: Icon(
                  Icons.lock_outline,
                  color: ColorManager.primaryColor,
                ),
              ),
              SizedBox(height: Constans.getSize(context).height *.02 ,),
              RememberAndForgetPass(),
              SizedBox(height: Constans.getSize(context).height *.02 ,),
              CustomButton(
                  onPressed: (){
                    DioHelper.postData(
                        url: "/login",
                        data: {
                          "email": "admin@admin.com",
                          "password": "12345678"
                        })
                        .then((value){
                          print("response massage ${value.data.toString()}");
                    }).catchError((e){
                      print("error  ${e.toString()}");
                    });

              },
                  buttonText: StringsManager.logInText),
              DoNotHaveAccWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
