class UserEntity {
  final int id;
  final String name;
  final String email;
  final String? password;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.password,
  });
}
