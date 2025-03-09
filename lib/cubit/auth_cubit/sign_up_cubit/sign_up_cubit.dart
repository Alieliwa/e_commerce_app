import 'package:bloc/bloc.dart';
import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/shared/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);


  void SignUp({
   required String? name,
    required String? email,
    required String? phone,
    required  String? password,
}){
    emit(SignUpLoading());
    DioHelper.postData(
        url: register,
        data: {
          "name" : name,
          "email" : email,
          "password" : password,
          "phone" : phone,
        }).then((value){
          emit(SignUpSucsses(value.data["message"],
              value.data["status"]));
          print("SignUp ${value.data}");
    }).catchError((error){
      print("SignUp error ${error.toString()}");
      emit(SignUpError(error.toString()));
    });
  }


}
