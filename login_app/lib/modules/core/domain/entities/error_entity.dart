// ignore_for_file: public_member_api_docs, sort_constructors_first
class ErrorEntity {
  final String? Function(String) error;
  bool isValid;
  final String message;
  ErrorEntity({
    required this.error,
    required this.isValid,
    required this.message,
  });
}
