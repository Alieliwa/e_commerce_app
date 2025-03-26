class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  UserModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return UserModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$status, $message, $data, ";
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final int? points;
  final int? credit;
  final String? token;

  Data copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    int? points,
    int? credit,
    String? token,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      points: points ?? this.points,
      credit: credit ?? this.credit,
      token: token ?? this.token,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
      points: json["points"],
      credit: json["credit"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
    "token": token,
  };

  @override
  String toString(){
    return "$id, $name, $email, $phone, $image, $points, $credit, $token, ";
  }
}
