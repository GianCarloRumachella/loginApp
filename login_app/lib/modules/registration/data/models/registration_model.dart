import 'dart:convert';

import 'package:login_app/modules/registration/domain/entities/registration_entity.dart';

class RegistrationModel extends RegistrationEntity {
  RegistrationModel({
    required super.name,
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) => RegistrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegistrationModel(name: $name, email: $email, password: $password)';
}
