import 'package:gp_nafsi/features/auth/domain/entites/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.age,
      required super.preferance,
      required super.keywords,
      required super.mood,
      required super.profileImage,
      required super.token});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['_id'],
      email: json['email'],
      age: json['age'],
      firstName: json['firstname'],
      keywords: List.castFrom<dynamic, String>(json['keywords']),
      preferance: List.castFrom<dynamic, dynamic>(json['preferance']),
      mood: List.castFrom<dynamic, dynamic>(json['moood']),
      lastName: json['lastname'],
      profileImage: json['profileimage'],
      token: json['token'],
    );
  }

  //copy with
  UserDataModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    int? age,
    List<dynamic>? preferance,
    List<dynamic>? mood,
    List<String>? keywords,
    String? profileImage,
    String? token,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      age: age ?? this.age,
      preferance: preferance ?? this.preferance,
      mood: mood ?? this.mood,
      keywords: keywords ?? this.keywords,
      profileImage: profileImage ?? this.profileImage,
      token: token ?? this.token,);
  }
}

class UserUpdateModel {
  final String fName;
  final String lName;
  final int age;

  UserUpdateModel(
      {required this.fName, required this.lName, required this.age});

  Map<String, dynamic> toJson() {
    return {"firstname": fName, "lastname": lName, "age": age};
  }
}
