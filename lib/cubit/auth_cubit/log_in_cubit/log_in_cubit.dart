import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/shared/network/end_point.dart';
import 'package:ecomerce/model/user_model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  static LogInCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  void logIn({
    required String? email,
    required  String? password,
  })
  {
    emit(LogInLoading());
    DioHelper.postData(
        url: login,
        data: {
          "email" : email,
          "password" : password
        }).then((value){
          userModel =
              UserModel.fromJson(value.data);
      emit(LogInSucsses(userModel),);
      if (kDebugMode) {
        print("LogIn ${value.data}");
      }
    }).catchError((error){
      if (kDebugMode) {
        print("LogIn error ${error.toString()}");
      }
      emit(LogInError(error.toString()));
    });
  }


  IconData suffix = Icons.visibility;
  bool secirty = true;
  void changePasswordVisibility(){
    secirty = !secirty;
    suffix = secirty ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityStates());
  }



}
