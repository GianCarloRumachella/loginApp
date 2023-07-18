import 'package:dartz/dartz.dart';
import 'package:login_app/modules/address/data/datasource/address_datasoure.dart';
import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/address/domain/repositories/address_repository.dart';
import 'package:login_app/modules/core/failures/failure.dart';

class AddressRepositoryImp implements AddressRepository {
  final AddressDatasource _datasource;

  AddressRepositoryImp({required AddressDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, AddressModel>> getAddress(String zipCode) async {
    try {
      var response = await _datasource.getAddress(zipCode);
      return Right(response);
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, int>> saveAddress(AddressModel address) async {
    try {
      var response = await _datasource.saveAddress(address);
      return Right(response);
    } on Failure catch (e) {
      return Left(Failure(e.message));
    }
  }
}
