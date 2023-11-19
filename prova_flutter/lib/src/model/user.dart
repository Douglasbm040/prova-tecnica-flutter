// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String user;
  String password;

  User({required this.user, required this.password});
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      user: map['user'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
