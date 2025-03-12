import 'package:bloc/bloc.dart';
import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/shared/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  static LogInCubit get(context) => BlocProvider.of(context);


  void logIn({
    required String? email,
    required  String? password,
  }){
    emit(LogInLoading());
    DioHelper.postData(
        url: login,
        data: {
          "email" : email,
          "password" : password
        }).then((value){
      emit(LogInSucsses(
        value.data["status"],
        value.data["message"],
      ),);
      print("LogIn ${value.data}");
    }).catchError((error){
      print("LogIn error ${error.toString()}");
      emit(LogInError(error.toString()));
    });
  }



}
