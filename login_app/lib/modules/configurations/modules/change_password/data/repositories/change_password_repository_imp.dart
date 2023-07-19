import 'package:dartz/dartz.dart';
import 'package:login_app/modules/configurations/modules/change_password/data/datasource/change_password_datasource.dart';
import 'package:login_app/modules/configurations/modules/change_password/domain/repositories/change_password_repository.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/failures/failure.dart';

class ChangePasswordRepositoryImp implements ChangePasswordRepository {
  final ChangePasswordDatasource _datasource;

  ChangePasswordRepositoryImp({required ChangePasswordDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, int>> updatePassword(UserModel user) async {
    try {
      var response = await _datasource.updatePassword(user);
      return Right(response);
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }
}
