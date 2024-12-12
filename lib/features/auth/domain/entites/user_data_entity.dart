import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable{
  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? age;
  final List<dynamic> preferance;
  final List<dynamic> mood;
  final List<String> keywords;
  final String? token;
  final String? profileImage;

  const UserDataEntity( {
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.preferance,
    required this.keywords,
    required this.mood,
    required this.profileImage,
    required this.token
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    age,
    preferance,
    keywords,
    mood,
    profileImage
  ];
}