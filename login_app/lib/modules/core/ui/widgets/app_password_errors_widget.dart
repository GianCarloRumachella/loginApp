import 'package:flutter/material.dart';
import 'package:login_app/modules/core/domain/entities/error_entity.dart';

class AppPasswordErrorsWidget extends StatelessWidget {
  final List<ErrorEntity> errors;

  const AppPasswordErrorsWidget({
    super.key,
    required this.errors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: errors
          .map(
            (error) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                error.message,
                style: TextStyle(color: error.isValid ? Colors.green : Colors.red),
              ),
            ),
          )
          .toList(),
    );
  }
}
