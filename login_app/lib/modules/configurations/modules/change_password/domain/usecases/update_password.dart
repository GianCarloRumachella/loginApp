import 'package:dartz/dartz.dart';
import 'package:login_app/modules/configurations/modules/change_password/domain/repositories/change_password_repository.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/failures/failure.dart';

abstract class UpdatePassword {
  Future<Either<Failure, int>> call(UserModel user);
}

class UpdatePasswordImp implements UpdatePassword {
  final ChangePasswordRepository _repository;

  UpdatePasswordImp({required ChangePasswordRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, int>> call(UserModel user) async {
    return _repository.updatePassword(user);
  }
}
