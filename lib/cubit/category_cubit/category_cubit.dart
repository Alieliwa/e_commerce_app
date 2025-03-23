import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecomerce/core/shared/network/dio_helper.dart';
import 'package:ecomerce/core/shared/network/end_point.dart';
import 'package:ecomerce/model/category_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);


 CategoryData? categoryData;
  void getCategoriesData(){
    emit(CategoryLoading());
    DioHelper.getData(url: categories,)
        .then((value){
          categoryData = CategoryData.fromJson(value.data);
          emit(CategorySucsses(categoryData));
          log("Category Data   ${categoryData!.listCategory!.categories![0].image}");
    }).catchError((error){
      log("Error Category ${error.toString()}");
      emit(CategoryError(error.toString()));

    });
    
  }

}
