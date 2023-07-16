// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/registration/data/models/registration_model.dart';
import 'package:login_app/modules/registration/domain/repositories/registration_repository.dart';

abstract class CreateUserUsecase {
  Future<Either<Failure, int>> call(RegistrationModel registrationModel);
}

class CreateUserUsecaseImp implements CreateUserUsecase {
  final RegistrationRepository repository;
  CreateUserUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, int>> call(RegistrationModel registrationModel) async {
    return await repository.createUser(registrationModel);
  }
}