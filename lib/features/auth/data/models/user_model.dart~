class UserModel {
  final String id;
  final String? fName;
  final String? lName;
  final String? email;
  final int? age;
  final List<dynamic> preferance;
  final List<dynamic> mood;
  final List<String> keywords;
  late String? token;
  late String? profileImage;

  UserModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.age,
    required this.preferance,
    required this.keywords,
    required this.mood,
    required this.profileImage
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['_id'],
        email: json['email'],
        age: json['age'],
        fName: json['firstname'],
        keywords: List.castFrom<dynamic, String>(json['keywords']),
        preferance: List.castFrom<dynamic, dynamic>(json['preferance']),
        mood:  List.castFrom<dynamic, dynamic>(json['moood']),
        lName: json['lastname'],
      profileImage: json['profileimage']);
  }
}

class UserUpdateModel
{
  final String fName;
  final String lName;
  final int age;

  UserUpdateModel({required this.fName, required this.lName, required this.age});

  Map<String,dynamic> toJson()
  {
    return {"firstname":fName,"lastname":lName,"age":age};
  }
}
