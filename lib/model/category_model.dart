class CategoryModel{
  int? id;
  String? name;
  String? image;

  CategoryModel({this.name, this.id, this.image});

  // named constractor

    factory CategoryModel.fromJson(Map<String,dynamic> jsonData){
      return CategoryModel(
        id: jsonData['id'],
        name: jsonData['name'],
        image: jsonData['image'],
      );
    }

}