import 'dart:convert';

import 'package:login_app/modules/core/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.zipCode,
    required super.street,
    required super.number,
    required super.complement,
    required super.neighborhood,
    required super.city,
    required super.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'zipCode': zipCode,
      'street': street,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['cep'] as String,
      street: map['logradouro'] as String,
      number: map['numero'] ?? '',
      complement: map['complemento'] as String,
      neighborhood: map['bairro'] as String,
      city: map['localidade'] as String,
      state: map['uf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(cep: $zipCode, logradouro: $street, numero: $number, complemento: $complement, bairro: $neighborhood, localidade: $city, uf: $state)';
  }
}
