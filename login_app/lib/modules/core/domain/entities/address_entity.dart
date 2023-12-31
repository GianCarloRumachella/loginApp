class AddressEntity {
  final String? id;
  final String zipCode;
  final String street;
  final String? number;
  final String complement;
  final String neighborhood;
  final String city;
  final String state;
  final String? userId;

  AddressEntity({
    this.id,
    required this.zipCode,
    required this.street,
    required this.number,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
    this.userId,
  });
}
