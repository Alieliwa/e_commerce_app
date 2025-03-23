import 'list_category_model.dart';

class CategoryData{

  late final ListCategory? listCategory;
  CategoryData({this.listCategory});
  factory CategoryData.fromJson(Map<String,dynamic> jsonData){
    return CategoryData(
        listCategory: jsonData['data'] == null ? null : ListCategory.fromJson(jsonData['data']),
    );
  }
}

//
// class CategoryModel {
//   CategoryModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   final bool? status;
//   final dynamic message;
//   final Data? data;
//
//   CategoryModel copyWith({
//     bool? status,
//     dynamic? message,
//     Data? data,
//   }) {
//     return CategoryModel(
//       status: status ?? this.status,
//       message: message ?? this.message,
//       data: data ?? this.data,
//     );
//   }
//
//   factory CategoryModel.fromJson(Map<String, dynamic> json){
//     return CategoryModel(
//       status: json["status"],
//       message: json["message"],
//       data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data?.toJson(),
//   };
//
//   @override
//   String toString(){
//     return "$status, $message, $data, ";
//   }
// }
//
// class Data {
//   Data({
//     required this.currentPage,
//     required this.data,
//     required this.firstPageUrl,
//     required this.from,
//     required this.lastPage,
//     required this.lastPageUrl,
//     required this.nextPageUrl,
//     required this.path,
//     required this.perPage,
//     required this.prevPageUrl,
//     required this.to,
//     required this.total,
//   });
//
//   final int? currentPage;
//   final List<Datum> data;
//   final String? firstPageUrl;
//   final int? from;
//   final int? lastPage;
//   final String? lastPageUrl;
//   final dynamic nextPageUrl;
//   final String? path;
//   final int? perPage;
//   final dynamic prevPageUrl;
//   final int? to;
//   final int? total;
//
//   Data copyWith({
//     int? currentPage,
//     List<Datum>? data,
//     String? firstPageUrl,
//     int? from,
//     int? lastPage,
//     String? lastPageUrl,
//     dynamic? nextPageUrl,
//     String? path,
//     int? perPage,
//     dynamic? prevPageUrl,
//     int? to,
//     int? total,
//   }) {
//     return Data(
//       currentPage: currentPage ?? this.currentPage,
//       data: data ?? this.data,
//       firstPageUrl: firstPageUrl ?? this.firstPageUrl,
//       from: from ?? this.from,
//       lastPage: lastPage ?? this.lastPage,
//       lastPageUrl: lastPageUrl ?? this.lastPageUrl,
//       nextPageUrl: nextPageUrl ?? this.nextPageUrl,
//       path: path ?? this.path,
//       perPage: perPage ?? this.perPage,
//       prevPageUrl: prevPageUrl ?? this.prevPageUrl,
//       to: to ?? this.to,
//       total: total ?? this.total,
//     );
//   }
//
//   factory Data.fromJson(Map<String, dynamic> json){
//     return Data(
//       currentPage: json["current_page"],
//       data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//       firstPageUrl: json["first_page_url"],
//       from: json["from"],
//       lastPage: json["last_page"],
//       lastPageUrl: json["last_page_url"],
//       nextPageUrl: json["next_page_url"],
//       path: json["path"],
//       perPage: json["per_page"],
//       prevPageUrl: json["prev_page_url"],
//       to: json["to"],
//       total: json["total"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage,
//     "data": data.map((x) => x?.toJson()).toList(),
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "next_page_url": nextPageUrl,
//     "path": path,
//     "per_page": perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to,
//     "total": total,
//   };
//
//   @override
//   String toString(){
//     return "$currentPage, $data, $firstPageUrl, $from, $lastPage, $lastPageUrl, $nextPageUrl, $path, $perPage, $prevPageUrl, $to, $total, ";
//   }
// }
//
// class Datum {
//   Datum({
//     required this.id,
//     required this.name,
//     required this.image,
//   });
//
//   final int? id;
//   final String? name;
//   final String? image;
//
//   Datum copyWith({
//     int? id,
//     String? name,
//     String? image,
//   }) {
//     return Datum(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       image: image ?? this.image,
//     );
//   }
//
//   factory Datum.fromJson(Map<String, dynamic> json){
//     return Datum(
//       id: json["id"],
//       name: json["name"],
//       image: json["image"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "image": image,
//   };
//
//   @override
//   String toString(){
//     return "$id, $name, $image, ";
//   }
// }
