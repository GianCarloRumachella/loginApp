// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';

import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';
import 'package:login_app/modules/login/domain/repositories/login_repository.dart';

abstract class AuthUserUsecase {
  Future<Either<Failure, UserModel>> call(LoginModel loginModel);
}

class AuthUserUsecaseImp implements AuthUserUsecase {
  final LoginRepository repository;

  AuthUserUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserModel>> call(LoginModel loginModel) async {
    return repository.authUser(loginModel);
  }
}
