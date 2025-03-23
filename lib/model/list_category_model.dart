import 'package:ecomerce/model/category_model.dart';

class ListCategory{
  List<CategoryModel>? categories;
  ListCategory({this.categories});
  factory ListCategory.fromJson(Map<String,dynamic> jsonData)
  {
    return ListCategory(
      categories: jsonData['data'] == null ? [] :
      List<CategoryModel>.from(jsonData["data"]!.map((x) => CategoryModel.fromJson(x))),
    );
  }
}