import 'package:dartz/dartz.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/failures/failure.dart';

abstract class ChangePasswordRepository {
  Future<Either<Failure, int>> updatePassword(UserModel user);
}
