import 'dart:convert';

import 'package:login_app/modules/core/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    super.id,
    required super.zipCode,
    required super.street,
    required super.number,
    required super.complement,
    required super.neighborhood,
    required super.city,
    required super.state,
    super.userId,
  });

  Map<String, dynamic> toMapUpdate() {
    return <String, dynamic>{
      'id': id.toString(),
      'zipCode': zipCode,
      'street': street,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'id_user': userId.toString(),
    };
  }

  Map<String, dynamic> toMapInsert() {
    return <String, dynamic>{
      'zipCode': zipCode,
      'street': street,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'id_user': userId.toString(),
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['cep'] ?? '',
      street: map['logradouro'] ?? '',
      number: map['numero'] ?? '',
      complement: map['complemento'] ?? '',
      neighborhood: map['bairro'] ?? '',
      city: map['localidade'] ?? '',
      state: map['uf'] ?? '',
    );
  }

  String toJsonInsert() => json.encode(toMapInsert());
  String toJsonUpdate() => json.encode(toMapUpdate());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(cep: $zipCode, logradouro: $street, numero: $number, complemento: $complement, bairro: $neighborhood, localidade: $city, uf: $state)';
  }
}
