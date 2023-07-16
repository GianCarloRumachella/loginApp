// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/registration/data/datasource/registration_datasource.dart';
import 'package:login_app/modules/registration/data/models/registration_model.dart';
import 'package:login_app/modules/registration/domain/repositories/registration_repository.dart';

class RegistrationRepositoryImp implements RegistrationRepository {
  final ResgistrationDatasource datasource;

  RegistrationRepositoryImp({
    required this.datasource,
  });

  @override
  Future<Either<Failure, int>> createUser(RegistrationModel registrationModel) async {
    try {
      var response = await datasource.createUser(registrationModel);
      return Right(response);
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }
}
