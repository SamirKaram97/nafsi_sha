class RegisterRequestModel
{
  final String firstname;
  final String lastname;
  final String gender;
  final String email;
  final String age;
  final String password;

  RegisterRequestModel({required this.firstname, required this.lastname,required this.gender, required this.email, required this.age,required this.password});

  Map<String,dynamic> toJson()
  {
    return {"firstname":firstname,"lastname":lastname,"email":email,"gender":gender,"age":age,"password":password};
  }
}