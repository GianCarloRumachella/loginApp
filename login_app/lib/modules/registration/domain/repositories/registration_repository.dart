import 'package:dartz/dartz.dart';
import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/registration/data/models/registration_model.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, int>> createUser(RegistrationModel registrationModel);
}
