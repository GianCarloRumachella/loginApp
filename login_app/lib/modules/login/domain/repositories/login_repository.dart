import 'package:dartz/dartz.dart';
import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> authUser(LoginModel loginModel);
}
