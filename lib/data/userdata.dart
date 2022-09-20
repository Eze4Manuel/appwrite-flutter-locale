import 'package:appwrite/appwrite.dart';

class UserFields{
  static const String id = "\$id";
  static const String name = "name";
  static const String email = "email";
  static const String registrationDate =  "registration";
}

class User {
  String ? id;
  String ? name;
  String ? email;

  User({required this.id, required this.email, required this.name,});

  User.fromJson(Account? json){
    print(json);
  }

  Map<String,dynamic> toJson (){
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data[UserFields.name] = name;
    return data;
  }
}
