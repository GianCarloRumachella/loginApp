// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/login/data/datasource/login_datasource.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';
import 'package:login_app/modules/login/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImp({
    required this.datasource,
  });

  @override
  Future<Either<Failure, bool>> authUser(LoginModel loginModel) async {
    //TODO: fazer o tratamento do erro aqui e jogar as failures pro usuario
    try {
      var response = await datasource.authUser(loginModel);
      return Right(response);
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }
}
