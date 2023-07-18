import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/home/data/datasource/home_datasource.dart';
import 'package:login_app/modules/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDatasource _datasource;

  HomeRepositoryImp({required HomeDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, List<AddressModel>>> getAddressesByUser(String id) async {
    try {
      var response = await _datasource.getAddressesByUser(id);
      return Right(response);
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }
}
